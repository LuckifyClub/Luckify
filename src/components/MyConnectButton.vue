<template>
  <div>
    <div v-if="web3">
      <q-btn outline v-if="!account" :disable="!getProvider" @click="CONNECT_CLICK" color="primary">Connect</q-btn>
      <q-btn outline v-if="account" color="primary">{{ maskWalletAddress(account) }}</q-btn>
    </div>
    <div v-else class="bg-red">No web3 detected. Please install https://metamask.io/</div>
  </div>
</template>

<script>
import { mapState, mapGetters } from 'vuex';
import { dialog } from 'src/misc/dialog';
import { ethers } from 'ethers';

export default {
  name: 'MyConnectButton',

  computed: {
    ...mapState('app', ['web3', 'account', 'balance']),
    ...mapGetters('app', ['getProvider']),
  },

  methods: {
    async CONNECT_CLICK() {
      this.$env.console.log('CONNECT_CLICK');
      try {
        const accounts = await this.getProvider.send('eth_requestAccounts', []);
        // const accounts = await this.provider.listAccounts(); // Bunu kullanma (direk window acmiyor)
        await this.SET_ACCOUNT(accounts);
      } catch (error) {
        if (error.code === -32002) {
          // dialog({ message: error.reason || error.message, type: 'error' });
          dialog({ message: 'Already processing. Unlock your wallet to see the connection request.', type: 'error' });
        }

        this.$env.console.error(error);
      }
    },

    async SET_ACCOUNT(accounts) {
      if (accounts && accounts.length > 0) {
        const account = accounts[0];
        this.$env.console.log('Accouts:', accounts);
        this.$env.console.log('Accout:', account);

        this.$store.commit('app/setAccount', account);

        // this.account = account;
        // const balance = await this.provider.getBalance('ethers.eth');
        const balance = await this.getProvider.getBalance(account);
        this.$env.console.log('Balance:', balance);
        this.$env.console.log('Balance:', ethers.utils.formatEther(balance));
        // this.balance = ethers.utils.formatEther(balance);

        this.$store.commit('app/setBalance', balance);

        const network = await this.getProvider.getNetwork();
        const { chainId, name } = network;
        this.$env.console.log('network:', network);
        this.$env.console.log('chainId:', chainId);
        // if (name !== 'goerli') {
        //   await this.ADD_NETWORK();
        // }
      } else {
        this.$env.console.log('user not connected');
        this.$store.commit('app/setAccount', null);
        // this.account = null;
      }
    },
  },
};
</script>
