<template>
  <div id="q-app">
    <router-view />
  </div>
</template>

<script>
const { ethereum } = typeof window !== 'undefined' && window;

import { mapState, mapGetters } from 'vuex';
import { ethers } from 'ethers';

export default {
  name: 'App',

  computed: {
    ...mapState('app', ['web3', 'account', 'balance']),
    ...mapGetters('app', ['getProvider']),
  },

  async created() {
    if (window.ethereum) {
      // ethereum.on('disconnect', () => {
      //   this.$env.console.log('[WALLET]: Disconnected');
      // });

      this.$store.commit('app/setWeb3', true);
      // const provider = new ethers.providers.Web3Provider(window.ethereum);
      const accounts = await this.getProvider.listAccounts();
      this.$env.console.log('accounts:', accounts);
      await this.SET_ACCOUNT(accounts);
    } else {
      this.$env.console.error('No web3 detected');
    }
  },

  methods: {
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
  },
};
</script>
