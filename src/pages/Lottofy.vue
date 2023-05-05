<template>
  <q-page class="aller">
    <div class="connector q-ma-md z-max" :class="od('absolute-right') + om('absolute-center-top')">
      <div v-if="web3">
        <q-btn class="q-ml-sm" v-if="!account" :disable="!provider" @click="CONNECT_CLICK" color="primary">Connect</q-btn>
        <q-btn class="q-ml-sm" v-if="account" color="primary">{{ maskWalletAddress(account) }}</q-btn>
        <q-btn class="q-ml-sm" v-if="account" color="primary" @click="GET_TICKET_CLICK">Get Ticket</q-btn>
      </div>
      <div v-else class="bg-red">No web3 detected. Please install https://metamask.io/</div>
    </div>

    <div id="app" ref="container" class="luckpad" :class="om('full-width')">

      <div class="flex column items-center full-width ">

        <div class="container flex full-width items-start justify-start " :class="od('row') + om('column')">

          <div class="flex row q-mx-xl full-width items-baseline justify-center">
            <img alt="luckify logo" src="~assets/luckify-logo.svg" class="logoimg z-max q-my-xl"
              :class="od('') + om('full-width')" />
            <div class="text-h1 q-ma-xl">X</div>
            <img alt="lottofy logo" src="~assets/lottofy-logo.svg" class="logoimg z-max q-my-xl"
              :class="od('') + om('full-width')" />
          </div>

          <div class="game-cards flex justify-center">
            <div class="game-card">
              
            </div>

          </div>



        </div>

        <div class="full-width bg-primary text-secondary text-center text-h2 q-py-xl text-bold">
          <div>May the luck be with you!</div>
          <div class="smicons">
            <a href="https://t.me/luckifyclub" target="_blank"><img src="~assets/sm-telegram.svg"
                alt="LUCKIFY Telegram"></a>
            <a href=" https://twitter.com/luckifyclub" target="_blank"><img src="~assets/sm-twitter.svg"
                alt="LUCKIFY Twitter"></a>
          </div>
        </div>
      </div>
  </div>
</q-page></template>

<script>
const { ethereum } = typeof window !== 'undefined' && window;

import { ethers } from 'ethers';
import { dialog } from 'src/misc/dialog';
import Artifact from 'src/contracts/Lottery.json';
import { Network, Alchemy } from 'alchemy-sdk';
import { wait } from 'src/misc/helpers';

import countdown from '../components/countdown.vue';

const settings = {
  apiKey: 'yUWada0da6pXSsB-3rTcNTAxLwsrLyfj',
  network: Network.ETH_GOERLI,
};

const alchemy = new Alchemy(settings);

export default {
  components: { countdown },
  name: 'PageIndex',

  data() {
    return {
      web3: false,
      provider: null,
      account: null,
      balance: null,
      signer: null,
    };
  },

  watch: {
    provider: {
      immediate: true,

      handler(n) {
        if (n) {
          this.$env.console.log('[Provider is set]:', n);

          ethereum.on('accountsChanged', async () => {
            this.$env.console.log('[WALLET]: accountsChanged');
            const accounts = await n.listAccounts();
            this.$env.console.log(accounts);
            this.SET_ACCOUNT(accounts);
          });

          ethereum.on('chainChanged', async () => {
            this.$env.console.log('[WALLET]: chainChanged');
            window.location.reload();
            // const accounts = await n.listAccounts();
            // this.$env.console.log(accounts);
            // this.SET_ACCOUNT(accounts);
          });

          // n.on('disconnect', () => {
          //   this.$env.console.log('[WALLET]: Disconnected');
          // });

          // n.on('accountsChanged', () => {
          //   this.$env.console.log('[WALLET]: accountsChanged');
          // });
        }
      },
    },
  },

  async created() {
    if (window.ethereum) {
      // ethereum.on('disconnect', () => {
      //   this.$env.console.log('[WALLET]: Disconnected');
      // });

      this.web3 = true;
      const provider = new ethers.providers.Web3Provider(window.ethereum);

      this.provider = provider;
      const accounts = await this.provider.listAccounts();
      this.$env.console.log('accounts:', accounts);
      await this.SET_ACCOUNT(accounts);
      // setTimeout(async () => {
      //   const provider = new ethers.providers.Web3Provider(window.ethereum);
      //   this.provider = provider;
      // }, 1500);
    } else {
      this.$env.console.error('No web3 detected');
    }
  },

  methods: {
    async CONNECT_CLICK() {
      this.$env.console.log('CONNECT_CLICK');
      try {
        const accounts = await this.provider.send('eth_requestAccounts', []);
        // const accounts = await this.provider.listAccounts(); // Bunu kullanma (direk window acmiyor)
        await this.SET_ACCOUNT(accounts);
      } catch (error) {
        this.$env.console.error(error);
      }
    },

    async GET_TICKET_CLICK() {
      this.$env.console.log('GET_TICKET_CLICK');

      const network = await this.provider.getNetwork();
      const { chainId, name } = network;

      this.$env.console.log('[NERWORK]:', chainId, name);

      if (name !== 'goerli') {
        try {
          await this.SWITCH_NETWORK();
          // const accounts = await this.provider.send('eth_requestAccounts', []);
          // await this.SET_ACCOUNT(accounts);
          // network = await this.provider.getNetwork();
          // ({ chainId, name } = network);
        } catch (error) {
          return new Error(error);
        }
      }

      const signer = this.provider.getSigner();
      this.signer = signer;
      try {
        const contractAddress = '0x45d62c2a9aB9150D7627715e357bC08aee73Ef26';
        const contract = new ethers.Contract(contractAddress, Artifact.abi, this.signer);
        // Call payable function
        const amount = ethers.utils.parseEther('0.00001');

        try {
          const tx = await contract.functions.enter({ value: amount });
          await tx.wait();
          dialog({ message: 'Congrats!!! You have a ticket!!!', type: 'success' });
        } catch (error) {
          dialog({ message: error.reason || error.message, type: 'error' });
          return new Error(error);
        }
      } catch (error) {
        // this.$env.console.error(error);
        // dialog({ message: error.message, type: 'error' });
        return new Error(error);
      }
    },

    async SET_ACCOUNT(accounts) {
      if (accounts && accounts.length > 0) {
        const account = accounts[0];
        this.$env.console.log('Accouts:', accounts);
        this.$env.console.log('Accout:', account);
        this.account = account;
        // const balance = await this.provider.getBalance('ethers.eth');
        const balance = await this.provider.getBalance(account);
        this.$env.console.log('Balance:', balance);
        this.$env.console.log('Balance:', ethers.utils.formatEther(balance));
        this.balance = ethers.utils.formatEther(balance);

        const network = await this.provider.getNetwork();
        const { chainId, name } = network;
        this.$env.console.log('network:', network);
        this.$env.console.log('chainId:', chainId);
        // if (name !== 'goerli') {
        //   await this.ADD_NETWORK();
        // }
      } else {
        this.$env.console.log('user not connected');
        this.account = null;
      }
    },

    async SWITCH_NETWORK() {
      this.$env.console.log('[SWITCH_NETWORK]:');
      try {
        await ethereum.request({
          method: 'wallet_switchEthereumChain',
          params: [{ chainId: '0x5' }],
        });
        this.$env.console.log('You have succefully switched to Goerli Test network');
        return 'ok';
      } catch (switchError) {
        // This error code indicates that the chain has not been added to MetaMask.
        if (switchError.code === 4902) {
          this.$env.console.log('This network is not available in your metamask, please add it');
        }
        this.$env.console.log('Failed to switch to the network');
        this.$env.console.error(switchError);
        throw new Error(switchError);
      }
    },

    async ADD_NETWORK() {
      const my_chainId = '0x5';
      const my_rpcURL = 'https://goerli.infura.io/v3/';
      const my_networkName = 'Goerli test network';
      const my_currencyName = 'GoerliETH';
      const my_currencySymbol = 'GoerliETH';
      const my_explorerURL = 'https://goerli.etherscan.io';
      await window.ethereum.request({
        method: 'wallet_addEthereumChain',
        params: [
          {
            chainId: my_chainId,
            chainName: my_networkName,
            rpcUrls: [my_rpcURL],
            blockExplorerUrls: [my_explorerURL],
            nativeCurrency: {
              name: my_currencyName,
              symbol: my_currencySymbol, // 2-6 characters long
              decimals: 18,
            },
          },
        ],
      });
    },

    async CALL_CONTRACT_READONLY() {
      this.$env.console.log('CALL_CONTRACT_READONLY');

      const latestBlock = await alchemy.core.getBlockNumber();
      console.log('latestBlock:', latestBlock);

      try {
        // const provider = new ethers.providers.JsonRpcProvider('goerli');
        // const defaultProvider = ethers.getDefaultProvider('goerli');
        const network = ethers.providers.getNetwork('goerli');

        const defaultProvider = new ethers.providers.EtherscanProvider('goerli', '2W3J35CYMSWGJ84DUSQXXGPY3H4UXJZNCC');

        // const defaultProvider = ethers.getDefaultProvider('goerli', {
        //   etherscan: '2W3J35CYMSWGJ84DUSQXXGPY3H4UXJZNCC',
        //   // infura: YOUR_INFURA_PROJECT_ID,
        //   // Or if using a project secret:
        //   // infura: {
        //   //   projectId: YOUR_INFURA_PROJECT_ID,
        //   //   projectSecret: YOUR_INFURA_PROJECT_SECRET,
        //   // },
        //   // alchemy: YOUR_ALCHEMY_API_KEY,
        //   // pocket: YOUR_POCKET_APPLICATION_KEY,
        //   // Or if using an application secret key:
        //   // pocket: {
        //   //   applicationId: ,
        //   //   applicationSecretKey:
        //   // },
        //   // ankr: YOUR_ANKR_API_KEY,
        // });

        // const network = ethers.providers.getNetwork('goerli');
        // const provider = new ethers.providers.EtherscanProvider(network);
        const contractAddress = '0x45d62c2a9aB9150D7627715e357bC08aee73Ef26';
        const contract = new ethers.Contract(contractAddress, Artifact.abi, defaultProvider);

        // Call a getter method
        const ret = await contract.getPlayers();
        this.$env.console.log(`Players are ${ret}`);

        await wait(2000);

        const ret1 = await contract.organizer();
        this.$env.console.log(`organizer ${ret1}`);
      } catch (error) {
        this.$env.console.error(error);
      }
    },
    async DISCONNECT_CLICK() {
      this.$env.console.log('DISCONNECT_CLICK');
      // try {
      //   const accounts = await this.provider.request({ method: 'eth_requestAccounts' });
      //   const account = accounts[0];
      //   this.$env.console.log('Accouts:', accounts);
      //   this.$env.console.log('Accout:', account);
      //   this.account = account;
      // } catch (error) {
      //   this.$env.console.error(error);
      // }
    },

    startApp() {
      if (this.provider !== window.ethereum) {
        dialog({ message: 'Do you have multiple wallets installed?', type: 'warning' });
        this.$env.console.error('Do you have multiple wallets installed?');
      }
    },
  },
};
</script>

<style scoped>
.logoimg{max-height:16vh; max-width: 300px;}
h1{max-width:46vw;}



.aller{display:flex;position:relative;justify-content:center;align-items:center;width:100vw;height:100vh;
  background:url('~assets/rich-bg-2.png') no-repeat; overflow:hidden;background-size:cover;background-position:center top;}

.luckpad {
  position: relative;
  display: flex; align-items: self-start;
  width: 94vw;
  height: 90vh;
  overflow-y: overflow; overflow-x: hidden;
  background: #e1ffdbb8;
  background-size: contain;
  box-shadow: 0 0 100px -20px #000;
  border: 2px solid white;
  border-radius: 50px 10px 10px 50px; backdrop-filter: blur(10px);

}


.info {
  max-width: 400px;
  margin: 2vh auto 1vh auto;
  padding: 0 1.9vh;
}
.box {
  padding: 20px;
  margin: 20px;
  width: 100%;
  max-width: 90vw;
  border-radius: 40px;
  box-shadow: 0 10px 30px -15px #000;
  background: #ebfcef;
}
.prizes {
  align-items: flex-end;
}
.prizes .bg-luck {
  background-image: linear-gradient(
    0deg,
    hsl(127deg 38% 34%) 0%,
    hsl(127deg 39% 31%) 34%,
    hsl(127deg 41% 29%) 59%,
    hsl(127deg 43% 26%) 77%,
    hsl(107deg 44% 30%) 88%,
    hsl(80deg 60% 36%) 94%,
    hsl(61deg 82% 39%) 98%,
    hsl(49deg 100% 50%) 100%
  );
}
.luckyfish{width:40%;}
.smicons {padding: 10px; border-radius: 20px;}
.smicons a {margin: 8px; }
.smicons a img {max-height: 55px; height: 55px; border-radius: 5px; padding: 8px; transition: all .5s ease; }
.smicons a:hover img {background: #202d23;}

.games-intro .games-box {display: flex; justify-content: center; align-items: center; height: 60vh;  overflow: hidden; position: relative; }
.games-intro .games-box::before {content: ''; z-index: -1;  width:100%; height:100%; transition: all .6s ease-in-out; position: absolute; transform: scale(1); filter: blur(0px) contrast(1.3);}
.games-intro .games-box:hover::before {transform: scale(1.5); filter: blur(5px) contrast(1);}
.games-intro .games-box.lottofy::before {background:url('~assets/lottofy-art.png') no-repeat; background-size:cover; background-position:center center;}
.games-intro .games-box.bingofy::before {background:url('~assets/bingofy-art.png') no-repeat; background-size: cover; background-position:center center;}
.games-intro .games-box.digify::before {background:url('~assets/digify-art.png') no-repeat; background-size: cover; background-position:center center;}
.games-intro .games-box .bander { width: 100%; position: absolute; top: 7%; transform: rotate(-6deg) scale(1.05); background: #ebfcef; color: #087c23; font-weight: 900; font-size: 1.22rem; padding: 1.4%; text-align: center;}
.games-intro .games-box .game-logo {padding: 0 15%; }

.games-intro .games-box .game-content {max-width: 70%; background: #00000000; transition: all .8s ease-out; padding: 5%; border-radius: 1rem; position: absolute; bottom: 5%;}
.games-intro .games-box .game-content .game-info { transition: all .8s ease-out; opacity: 0; margin-top: -150px; flex-wrap: nowrap;   }
.games-intro .games-box:hover .game-content { background: #ebfcef;  }
.games-intro .games-box:hover .game-content .game-info { opacity: 1; margin-top: 20px; }

/* .logo {width: 100%; background: url('~assets/green-bg.svg') no-repeat;} */

@media (max-width: 600px) {


 .luckpad{width:100vw;height:100vh;border:none;border-radius:0;overflow:overlay;}
  .logo-group {position: relative; height: unset;}
 .games-intro .games-box .game-content{bottom:10%; text-align: center;}
 .games-intro .games-box .game-logo {max-height:6vh;}


  .centrik{margin-top:0vh;}

  h1{width:940px;max-width:86vw;margin-top:0;}
  .luckyfish{width:70%;}

}
</style>
