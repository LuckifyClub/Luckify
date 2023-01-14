<template>
  <q-page class="luckpad column items-center" :class="om('full-width')">
    <div id="app" ref="container" class="flex justify-center full-width">
      <div v-if="web3">
        <q-btn v-if="!account" :disable="!provider" @click="CONNECT_CLICK" color="primary">Connect</q-btn>
        <q-btn v-if="account" color="primary">{{ maskWalletAddress(account) }}</q-btn>
      </div>
      <div class="bg-red">No web3 detected</div>

      <div class="container column full-width items-center q-mt-lg">
        <img alt="luckify logo" src="~assets/luckify-logo.svg" class="logoimg z-max q-my-xl" @click="CONNECT_CLICK" />
        <img alt="luckify logo" src="~assets/green-bg.svg" class="logobg absolute" />

        <div class="centrik z-max column items-center" :class="om('q-my-none')">
          <h1 class="flex no-wrap fold" :class="om('column q-mx-none q-pa-none items-center') + od('q-mx-xl')">
            <div class="text-h1 fan text-bold text-no-wrap text-primary text-center">Luckify is</div>
            <div class="text-h5 text-black" :class="od('q-pa-md') + om('text-center')">
              a platform that elevates the traditional lotto experience with its reliable onchain technology and with a bonus that's practically
              <span class="fan text-h3">unbeatable</span>, it's no wonder we're the go-to destination for players looking to
              <span class="fan text-h3">hit it big</span>.
            </div>
          </h1>

          <h2 class="fan q-pa-none text-center" :class="od('text-h1 q-ma-none') + om('text-h3 q-mx-md')">When do we start to win?</h2>
          <div class="text-black">
            <p class="text-black text-center"><strong>Ticket on-sale date:</strong> February 01, 2023 20:00:00 UTC</p>
            <p class="text-black text-center">The first draw will take place <b>one week</b> after the sale starts.</p>
          </div>
          <countdown />
          <div>
            <p class="text-h6 text-center text-black">
              The time has come to start winning big. <br />
              Are you ready to join the coolest lotteries in the game? <br />
              The countdown is on - let's make it happen!
            </p>
          </div>
          <h2 class="fan q-pa-none text-center" :class="od('text-h1 q-ma-none q-mt-xl') + om('text-h3 q-mx-md')">What is the difference?</h2>
          <div class="flex row" :class="od('q-ma-xl') + om('q-mx-md full-width q-my-none')">
            <div class="box column items-center col-md col-xs-12">
              <h3 class="text-h4 q-pa-none q-ma-none text-center text-bold">Unmanipulable and <br />Trusted Results</h3>
              <p class="text-h6 text-center info text-black">
                Luckify uses Chainlink VRF, a secure blockchain application, to randomly select the winners, ensuring that the results are fair and
                cannot be manipulated. Trust in the integrity of our system is extremely important to us.
              </p>
              <img alt="chainlink logo" src="~assets/chainlink-logo.svg" class="q-ma-sm" />
            </div>

            <div class="box column items-center col-md col-xs-12">
              <h3 class="text-h4 q-pa-none q-ma-none text-center text-bold">Big Prizes for <br />a Small Investment</h3>
              <p class="text-h6 text-center info text-black">
                Our participation fee may be higher than other lotteries, but the probability of winning and the prize amount are also significantly
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
          <h2 class="fan q-pa-none text-center" :class="od('text-h1 q-ma-none q-mt-xl') + om('text-h3 q-mx-md')">Participation details</h2>
          <div>
            <div class="column flex-center text-h5" :class="od('q-pa-xl') + om('q-pa-sm')">
              <div>For the first draw</div>
              <div class="column flex-center full-width" :class="od('q-px-xl q-mx-xl')">
                <div
                  class="flex no-wrap justify-between full-width bg-secondary rounded-borders q-mb-sm"
                  :class="od('q-px-xl q-mx-xl') + om('q-pa-sm')"
                >
                  <b class="q-pr-sm">Participation fee:</b> <span>0.1 ETH (~ $140)</span>
                </div>
                <div class="flex no-wrap justify-between full-width bg-secondary rounded-borders" :class="od('q-px-xl q-mx-xl') + om('q-pa-sm')">
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
                <div class="q-ma-none q-pa-none text-bold text-white" :class="od('text-h2') + om('text-h3 text-center')">150 ETH</div>
                <div class="text-body2 q-ma-none q-pa-none text-bold text-white">~$210.000</div>
              </div>
              <div class="column flex-center rounded-borders bg-luck q-py-xl" :class="od('q-px-md q-ma-sm') + om('q-mx-sm')">
                <div class="text-h3 text-white">#1</div>
                <div class="text-body1 q-ma-none q-pa-none text-white">Prize</div>
                <div class="q-ma-none q-pa-none text-bold text-white" :class="od('text-h2') + om('text-h3 text-center')">250 ETH</div>
                <div class="text-body2 q-ma-none q-pa-none text-bold text-white">~$350.000</div>
              </div>
              <div class="column flex-center rounded-borders bg-luck q-py-xs" :class="od('q-px-md q-ma-sm') + om('')">
                <div class="text-h3 text-white">#3</div>
                <div class="text-body1 q-ma-none q-pa-none text-white">Prize</div>
                <div class="q-ma-none q-pa-none text-bold text-white" :class="od('text-h2') + om('text-h3 text-center')">100 ETH</div>
                <div class="text-body2 q-ma-none q-pa-none text-bold text-white">~$140.000</div>
              </div>
            </div>
            <div class="extra text-center bg-primary text-white q-pa-md text-body2 rounded-borders q-mb-md q-mx-sm">
              In addition, <b>200 participants</b> will receive prizes worth 0.75 ETH (~$1000).
            </div>
            <div class="text-center q-mx-sm">
              * Prizes will be awarded in percentage of tickets sold. The prizes shown are only eligible if all tickets are sold.
            </div>
          </div>
        </div>

        <div class="column">
          <img alt="chainlink logo" src="~assets/LuckyFish.png" class="q-ma-sm luckyfish full-width" />
          <div class="text-body1 text-center">Meet LuckyFish. Follow him. He will bring you luck and opportunities!</div>
        </div>

        <div class="column flex-center q-px-md">
          <h2 class="fan q-pa-none text-center" :class="od('text-h1 q-ma-none q-mt-xl') + om('text-h3 q-mx-md')">Faq</h2>
          <div class="text-h5 text-bold q-mt-lg text-center">How does the lottery draw work?</div>
          <div class="text-body1 text-center text-black" :class="od('q-px-xl q-mx-xl')">
            Our lottery draw utilizes a secure blockchain application to randomly select the winner, ensuring that the results are fair and
            unmanipulable.
          </div>

          <div class="text-h5 text-bold q-mt-lg text-center">How much does it cost to participate in the lottery?</div>
          <div class="text-body1 text-center text-black" :class="od('q-px-xl q-mx-xl')">
            The participation fee for our lottery may be higher than other lotteries, but the probability of winning and the prize amount are
            significantly higher as well.
          </div>

          <div class="text-h5 text-bold q-mt-lg text-center">Is my personal information kept confidential?</div>
          <div class="text-body1 text-center text-black" :class="od('q-px-xl q-mx-xl')">
            Privacy is a top priority for our lottery. We understand that confidentiality is important to our players, and we take all necessary steps
            to protect your personal information. Rest assured that your information will be kept strictly confidential.
          </div>

          <div class="text-h5 text-bold q-mt-lg text-center">Can I play the lottery from any location?</div>
          <div class="text-body1 text-center text-black" :class="od('q-px-xl q-mx-xl')">
            Yes, our lottery is open to players from any location. However, we advise you to pay attention to the regulations in your country and not
            to do any illegal business.
          </div>

          <div class="text-h5 text-bold q-mt-lg text-center">When will the next lottery draw take place?</div>
          <div class="text-body1 text-center text-black" :class="od('q-px-xl q-mx-xl')">
            The draw date of the next lottery is published on our page. Check again for any changes.
          </div>
        </div>
      </div>

      <div class="full-width bg-primary text-secondary text-center text-h2 q-py-xl q-mt-xl text-bold">May the luck be with you!</div>
    </div>
  </q-page>
</template>

<script>
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
    };
  },

  async created() {
    if (window?.ethereum) {
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
        const { chainId } = network;
        this.$env.console.log('network:', network);
        this.$env.console.log('chainId:', chainId);
      } else {
        this.$env.console.log('user not connected');
      }
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
  width: 940px;
  max-width: 46vw;
}
.centrik {
  margin-top: 10vh;
}
.luckpad {
  max-width: 1920px;
  background: url('~assets/rich-bg.png') no-repeat #d0ebdb;
  background-size: contain;
  margin: 0 auto;
  box-shadow: 0 0 100px -50px #000;
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
.luckyfish {
  max-height: 50vh;
  max-width: 90vw;
}

/* .logo {width: 100%; background: url('~assets/green-bg.svg') no-repeat;} */

@media (max-width: 600px) {
  .centrik {
    margin-top: 0vh;
  }
  h1 {
    width: 940px;
    max-width: 86vw;
    margin-top: 0;
  }
}
</style>
