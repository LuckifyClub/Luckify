<template>
  <q-page class="q-pa-lg">
    <MyConnectButton />

    <game-card v-for="info in games" :key="info.id" :info="info"> </game-card>

    <!-- <q-btn outline v-if="account" color="primary" @click="CREATE_INSTANCE">CREATE INSTANCE</q-btn>
    <q-input v-model="info.id" label="id" />
    <q-input v-model="info.title" label="title" />
    <q-input v-model="info.image" label="image" />
    <q-input v-model="info.ticket_count" label="ticket count" />
    <q-input v-model="info.ticket_price" label="ticket price (eth)" />
    <q-input v-model="info.start_date" label="start_date" />
    <q-input v-model="info.end_date" label="end date" />
    <q-input v-model="info.award_ratio_list" label="award ratio list (comma seperated)" />
    <q-input v-model="info.payoff_count" label="payoff count" />
    <q-input v-model="info.payoff_ratio" label="payoff ratio" />
    <q-input v-model="info.marketing_ratios" label="marketing ratio list (comma seperated)" />
    <q-input v-model="info.marketing_addresses" label="marketing addresses (comma seperated)" /> -->
  </q-page>
</template>

<script>
import { mapState, mapGetters } from 'vuex';
import { dialog } from 'src/misc/dialog';
import { ethers } from 'ethers';

import Web3 from 'web3';
import { Network, Alchemy } from 'alchemy-sdk';

import { GAME_ABI, CONTRACT_ADDRESS, CURRENT_RPC, RPC } from 'src/misc/globals.js';

import GameCard from 'src/components/GameCard.vue';
import MyConnectButton from 'src/components/MyConnectButton.vue';

// const settings = {
//   apiKey: 'ho65Z1zi5RxU5BNBTMRvj-bz0JuIibYp',
//   network: Network.ETH_SEPOLIA,
// };

// const alchemy = new Alchemy(settings);

// const latestBlock = alchemy.core.getBlockNumber();

export default {
  components: { MyConnectButton, GameCard },
  name: 'Games',

  data() {
    return {
      games: [],

      info: {
        id: '3',
        title: 'Deneme3',
        image: 'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png',
        ticket_count: '20',
        ticket_price: '0.01',
        start_date: '1682140437',
        end_date: '1682144037',
        award_ratio_list: '30, 10, 5',
        payoff_count: '10',
        payoff_ratio: '1',
        marketing_ratios: '20',
        marketing_addresses: '0x4b8F3c2e26F057732bD5df4F07C33b001d82E40D, 0x1719fF78022C747FC6eD6ab8F7ce788b7a9c73E6',
      },
    };
  },

  computed: {
    ...mapState('app', ['web3', 'account', 'balance']),
    ...mapGetters('app', ['getProvider']),
  },

  async mounted() {
    for (let i = 0; i < 100; i++) {
      try {
        const game = await this.GET_INSTANCE(i + 1);
        this.games.push(game);
      } catch (error) {
        break;
      }
    }
  },

  methods: {
    async GET_INSTANCE(id) {
      this.$env.console.log('[GET_INSTANCE]:');
      const provider = new ethers.providers.JsonRpcProvider(RPC);
      const contract = new ethers.Contract(CONTRACT_ADDRESS, GAME_ABI.abi, provider);
      const result = await contract.getInstance(id);

      this.$env.console.log(result);
      this.$env.console.log(result.toString());

      try {
        // eslint-disable-next-line no-underscore-dangle
        const _info = {
          id: Web3.utils.toNumber(result.id),
          title: result.title,
          image: result.image,
          ticket_count: Web3.utils.toDecimal(result.ticket_count_price[0]),
          ticket_price: Web3.utils.fromWei(Web3.utils.hexToNumberString(Web3.utils.toHex(result.ticket_count_price[1])), 'ether'),
          start_date: Web3.utils.toDecimal(result.start_end_date[0]),
          end_date: Web3.utils.toDecimal(result.start_end_date[1]),
          award_ratio_list: result.award_ratio_list.map((e) => Web3.utils.toDecimal(e)),
          payoff_count: Web3.utils.toDecimal(result.payoff_count_ratio[0]),
          payoff_ratio: Web3.utils.toDecimal(result.payoff_count_ratio[1]),
          marketing_ratios: result.marketing_ratios.map((e) => Web3.utils.toDecimal(e)),
          marketing_addresses: result.marketing_addresses,
        };

        this.$env.console.log(_info);

        return _info;
      } catch (error) {
        return Promise.error(error);
      }
    },

    async CREATE_INSTANCE() {
      this.$env.console.log('[CREATE_INSTANCE]:');

      const {
        id,
        title,
        image,
        ticket_count,
        ticket_price,
        start_date,
        end_date,
        award_ratio_list,
        payoff_count,
        payoff_ratio,
        marketing_ratios,
        marketing_addresses,
      } = this.info;

      const ticket_price_wei = Web3.utils.toWei(ticket_price, 'ether');

      // eslint-disable-next-line max-len
      // const payload = `${id}, "${title}", "${image}", ["${ticket_count}", "${ticket_price_wei}"], ["${start_date}", "${end_date}"], [${award_ratio_list}], [${payoff_count}, ${payoff_ratio}], [${marketing_ratios}], [${marketing_addresses}]`;

      const payload = {
        _id: id,
        _title: title,
        _image: image,
        _ticket_count_price: [ticket_count, ticket_price_wei],
        _start_end_date: [start_date, end_date],
        _award_ratio_list: award_ratio_list.split(',').map((e) => parseInt(e, 10)),
        _payoff_count_ratio: [payoff_count, payoff_ratio],
        _marketing_ratios: marketing_ratios.split(',').map((e) => parseInt(e, 10)),
        _marketing_addresses: marketing_addresses.split(',').map((e) => e.trim()),
      };

      this.$env.console.log(payload);

      const network = await this.getProvider.getNetwork();
      const { chainId, name } = network;

      this.$env.console.log('[NERWORK]:', chainId, name);

      if (name !== 'sepolia') {
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

      const signer = this.getProvider.getSigner();
      try {
        const contract = new ethers.Contract(CONTRACT_ADDRESS, GAME_ABI.abi, signer);

        this.$env.console.log('contract:', contract);

        // Call payable function
        // const amount = ethers.utils.parseEther('0.01');

        try {
          const tx = await contract.functions.createInstance(...Object.values(payload));
          await tx.wait();
          dialog({ message: 'Congrats!!! Game Created Successfuly!!!', type: 'success' });
        } catch (error) {
          this.$env.console.error(error);
          dialog({ message: error.reason || error.message, type: 'error' });
          return new Error(error);
        }
      } catch (error) {
        // this.$env.console.error(error);
        // dialog({ message: error.message, type: 'error' });
        return new Error(error);
      }
    },
  },
};
</script>
