<template>
  <q-page class="aller">
    <div id="app" ref="container" class="luckpad" :class="om('full-width')">
      <div class="flex column items-center full-width ">
        <!-- <div class="connector  q-ma-md z-max" :class="od('absolute-right') + om ('absolute-center-top')">
          <div v-if="web3">
            <q-btn class="q-ml-sm" v-if="!account" :disable="!provider" @click="CONNECT_CLICK" color="primary">Connect</q-btn>
            <q-btn class="q-ml-sm" v-if="account" color="primary">{{ maskWalletAddress(account) }}</q-btn>
            <q-btn class="q-ml-sm" v-if="account" color="primary" @click="GET_TICKET_CLICK">Get Ticket</q-btn>
          </div>
          <div v-else class="bg-red">No web3 detected. Please install https://metamask.io/</div>
        </div> -->

        <div class="container flex full-width items-start justify-start " :class="od('row') + om ('column')">
          <div class="logo-group flex justify-center items-center " :class="od('column q-px-xl col-3') + om ('column q-px-sm wrap full-width')">
            <img alt="luckify logo" src="~assets/luckify-logo.svg" class="logoimg z-max q-my-xl" :class="od('') + om ('full-width')" @click="CONNECT_CLICK" />
            <div class="smicons bg-primary flex items-center">
              <a href="https://t.me/luckifyclub" target="_blank"><img src="~assets/sm-telegram.svg"
                  alt="LUCKIFY Telegram"></a>
              <a href=" https://twitter.com/luckifyclub" target="_blank"><img src="~assets/sm-twitter.svg"
                  alt="LUCKIFY Twitter"></a>
            </div>

            <h1 class="flex" :class="om('column q-mx-none q-pa-none items-center') + od('q-mx-sm')">
              <div class="full-width text-h2 fan text-bold text-no-wrap text-primary text-center">Luckify is</div>
              <div class="text-h6 text-green-10 text-center" :class="od('q-pa-md') + om('')">
                <!-- a transparent and reliable gaming platform. Game results are generated by block-chain based and fully provable randomisation.
                  It offers the world's <span class="fan text-h4">smartest</span> and most profitable gaming experiences. -->
                a blockchain-based gaming platform that provides transparent, secure, and fully provable randomization for
                game results.
                Join us for the world's <span class="fan text-h4">smartest</span> and most profitable gaming experience.
              </div>
            </h1>

          </div>
          <!-- <img alt="luckify logo" src="~assets/green-bg.svg" class="logobg absolute" /> -->

          <div class="col-9">
            <div class="z-max column items-center" :class="om('q-my-none')">

              <div class="section column items-center full-width">
                <h2 class="fan q-pa-none text-center" :class="od('text-h1 q-ma-none q-mt-xl') + om('text-h3 q-mx-md')">Luckify games
                </h2>
                <div class="games-intro row full-width " :class="od('q-pa-xl') + om('q-pa-none')">
                  <div class=" column q-pa-xl items-center games-box lottofy" :class="od('col-4') + om('col-12')">
                    <div class="bander">Our first game. Launching soon!</div>
                    <div class="game-content">
                      <img alt="lottofy logo" src="~assets/lottofy-logo.svg" class="game-logo q-ma-sm" />
                      <div class="game-info column items-center text-body1 text-center">
                        <span><b>Fully trusted blockchain-based lottery.</b></span>
                        <span>3 separate tiers, ticket fees starting from 0.005 ETH and prizes up to 40 ETH!</span>
                        <span><b>Details coming soon.</b></span>
                      </div>
                    </div>
                  </div>
                  <div class="column q-pa-xl items-center games-box bingofy" :class="od('col-4') + om('col-12')">
                    <div class="bander">Soon!     Soon!     Soon!</div>
                    <div class="game-content">
                      <img alt="bingofy logo" src="~assets/bingofy-logo.svg" class="game-logo q-ma-sm" />
                      <div class="game-info column items-center text-body1 text-center">
                        <span><b>A brand new excitement on Blockchain!</b></span>
                        <span>Get ready for an experience that will last for hours and create your own luck!</span>
                        <span><b>Details coming soon.</b></span>
                      </div>
                    </div>
                  </div>
                  <div class="column q-pa-xl items-center games-box digify" :class="od('col-4') + om('col-12')">
                    <div class="bander">Soon!     Soon!     Soon!</div>
                    <div class="game-content">
                      <img alt="digify logo" src="~assets/digify-logo.svg" class="game-logo q-ma-sm" />
                      <div class="game-info column items-center text-body1 text-center">
                        <span><b>There will be a unique and new way to win!</b></span>
                        <span>We have designed another exciting and new game for you.</span>
                        <span><b>Details coming soon.</b></span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="section column items-center">
                <h2 class="fan q-pa-none text-center" :class="od('text-h1 q-ma-none') + om('text-h3 q-mx-md')">When do we
                  start to win?</h2>
                <!-- <div>
                  <div class="text-black">
                    <p class="text-black text-center text-body1"><strong>Ticket on-sale date:</strong> May 15, 2023,
                      MON 20:00:00 UTC</p>
                    <p class="text-black text-center">The first draw will take place <b>one week</b> after the sale starts.
                    </p>
                  </div>
                  <countdown />
                  <div>
                    <p class="text-h6 text-center text-black">
                      The time has come to start winning big. <br />
                      Are you ready to join the coolest lotteries in the game? <br />
                      The countdown is on - let's make it happen!
                    </p>
                  </div>
                </div> -->
                <div class="text-h6 text-center text-black ">The ticket sales date for the first game will be published on our social media accounts. Stay tuned!</div>
              </div>
              <h2 class="fan q-pa-none text-center" :class="od('text-h1 q-ma-none q-mt-xl') + om('text-h3 q-mx-md')">What
                is the difference?</h2>
              <div class="flex row" :class="od('q-ma-xl') + om('q-mx-md full-width q-my-none')">
                <div class="box column items-center col-md col-xs-12">
                  <h3 class="text-h4 q-pa-none q-ma-none text-center text-bold">Unmanipulable and <br />Trusted Results
                  </h3>
                  <p class="text-h6 text-center info text-black">
                    Luckify uses Chainlink VRF, a secure blockchain application, to randomly select the winners, ensuring
                    that the results are fair and
                    cannot be manipulated. Trust in the integrity of our system is extremely important to us.
                  </p>
                  <img alt="chainlink logo" src="~assets/chainlink-logo.svg" class="q-ma-sm" />
                </div>

                <div class="box column items-center col-md col-xs-12">
                  <h3 class="text-h4 q-pa-none q-ma-none text-center text-bold">Big Prizes for <br />a Small Investment
                  </h3>
                  <p class="text-h6 text-center info text-black">
                    Our participation fee may be higher than other lotteries, but the probability of winning and the prize
                    amount are also significantly
                    higher. It is a unique opportunity to walk away with potentially life-changing winnings.
                  </p>
                </div>

                <div class="box column items-center col-md col-xs-12">
                  <h3 class="text-h4 q-pa-none q-ma-none text-center text-bold">
                    Privacy is <br />
                    a Top Priority
                  </h3>
                  <p class="text-h6 text-center info text-black">
                    No participant will be asked to do KYC, and we will aim to have Luckify live as a complete degen play!
                  </p>
                </div>
              </div>
              <!-- <h2 class="fan q-pa-none text-center" :class="od('text-h1 q-ma-none q-mt-xl') + om('text-h3 q-mx-md')">
                Participation details</h2>
              <div>
                <div class="column flex-center text-h5" :class="od('q-pa-xl') + om('q-pa-sm')">
                  <div>For the first draw</div>
                  <div class="column flex-center full-width" :class="od('q-px-xl q-mx-xl')">
                    <div class="flex no-wrap justify-between full-width bg-secondary rounded-borders q-mb-sm"
                      :class="od('q-px-xl q-mx-xl') + om('q-pa-sm')">
                      <b class="q-pr-sm">Participation fee:</b> <span>0.1 ETH (~ $140)</span>
                    </div>
                    <div class="flex no-wrap justify-between full-width bg-secondary rounded-borders"
                      :class="od('q-px-xl q-mx-xl') + om('q-pa-sm')">
                      <b class="q-pr-sm">Number of tickets:</b> <span>10,000</span>
                    </div>
                  </div>
                  <div class="text-body1">You can buy an unlimited number of tickets.</div>
                </div>
                <h3 class="q-pa-none q-ma-none text-center">Prizes*</h3>
                <div class="prizes flex flex-center q-mb-sm" :class="om('no-wrap q-mx-sm')">
                  <div class="column flex-center rounded-borders bg-luck q-py-md" :class="od('q-px-md q-ma-sm') + om('')">
                    <div class="text-h3 text-white">#2</div>
                    <div class="text-body1 q-ma-none q-pa-none text-white">Prize</div>
                    <div class="q-ma-none q-pa-none text-bold text-white"
                      :class="od('text-h2') + om('text-h3 text-center')">150 ETH</div>
                    <div class="text-body2 q-ma-none q-pa-none text-bold text-white">~$240.000</div>
                  </div>
                  <div class="column flex-center rounded-borders bg-luck q-py-xl"
                    :class="od('q-px-md q-ma-sm') + om('q-mx-sm')">
                    <div class="text-h3 text-white">#1</div>
                    <div class="text-body1 q-ma-none q-pa-none text-white">Prize</div>
                    <div class="q-ma-none q-pa-none text-bold text-white"
                      :class="od('text-h2') + om('text-h3 text-center')">250 ETH</div>
                    <div class="text-body2 q-ma-none q-pa-none text-bold text-white">~$400.000</div>
                  </div>
                  <div class="column flex-center rounded-borders bg-luck q-py-xs" :class="od('q-px-md q-ma-sm') + om('')">
                    <div class="text-h3 text-white">#3</div>
                    <div class="text-body1 q-ma-none q-pa-none text-white">Prize</div>
                    <div class="q-ma-none q-pa-none text-bold text-white"
                      :class="od('text-h2') + om('text-h3 text-center')">100 ETH</div>
                    <div class="text-body2 q-ma-none q-pa-none text-bold text-white">~$160.000</div>
                  </div>
                </div>
                <div class="extra text-center bg-primary text-white q-pa-md text-h5 rounded-borders q-mb-md q-mx-sm">
                  In addition, <b>200 participants</b> will receive prizes worth 1 ETH (~$1600).
                </div>
                <div class="text-center q-mx-sm">
                  * Prizes will be awarded in percentage of tickets sold. The prizes shown are only eligible if all
                  tickets are sold.
                </div>
              </div> -->
            </div>

            <div class="column full-width items-center q-mb-xl">
              <img alt="Lucky Fish" src="~assets/LuckyFish2.png" class="q-ma-sm luckyfish " />
              <div class="text-body1 text-center">Meet LuckyFish. Follow him. He will bring you luck and opportunities!
              </div>
            </div>

            <!-- <div class="column flex-center q-px-md q-mb-xl">
              <h2 class="fan q-pa-none text-center" :class="od('text-h1 q-ma-none q-mt-xl') + om('text-h3 q-mx-md')">Faq
              </h2>
              <div class="text-h5 text-bold q-mt-lg text-center">How does the lottery draw work?</div>
              <div class="text-body1 text-center text-black" :class="od('q-px-xl q-mx-xl')">
                Our lottery draw utilizes a secure blockchain application to randomly select the winner, ensuring that the
                results are fair and
                unmanipulable.
              </div>

              <div class="text-h5 text-bold q-mt-lg text-center">How much does it cost to participate in the lottery?
              </div>
              <div class="text-body1 text-center text-black" :class="od('q-px-xl q-mx-xl')">
                The participation fee for our lottery may be higher than other lotteries, but the probability of winning
                and the prize amount are
                significantly higher as well.
              </div>

              <div class="text-h5 text-bold q-mt-lg text-center">Is my personal information kept confidential?</div>
              <div class="text-body1 text-center text-black" :class="od('q-px-xl q-mx-xl')">
                Privacy is a top priority for our lottery. We understand that confidentiality is important to our players,
                and we take all necessary steps
                to protect your personal information. Rest assured that your information will be kept strictly
                confidential.
              </div>

            <div class="text-h5 text-bold q-mt-lg text-center">Can I play the lottery from any location?</div>
            <div class="text-body1 text-center text-black" :class="od('q-px-xl q-mx-xl')">
              Yes, our lottery is open to players from any location. However, we advise you to pay attention to the
              regulations in your country and not
              to do any illegal business.
            </div>

            <div class="text-h5 text-bold q-mt-lg text-center">When will the next lottery draw take place?</div>
            <div class="text-body1 text-center text-black" :class="od('q-px-xl q-mx-xl')">
              The draw date of the next lottery is published on our page. Check again for any changes.
            </div>
          </div> -->
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
.logoimg {
  max-height: 16vh;
}
h1 {
  max-width: 46vw;
}
.centrik {
  margin-top: 10vh;
}

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

.logo-group {position: sticky; top: 0; height: 90vh; backdrop-filter: blur(1px); flex-wrap: nowrap;}
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
