<template>
  <q-page class="q-pa-lg">
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
    <q-input v-model="info.marketing_addresses" label="marketing addresses (comma seperated)" />
    <q-btn @click="CREATE_INSTANCE">CREATE INSTANCE</q-btn>
  </q-page>
</template>

<script>
import Web3 from 'web3';

export default {
  name: 'Admin',

  data() {
    return {
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

  mounted () {
    console.log("web3:", web3)
  },

  methods: {
    CREATE_INSTANCE() {
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

      const payload = `${id}, "${title}", "${image}", ["${ticket_count}", "${ticket_price_wei}"]`;

      this.$env.console.log(payload);
    },
  },
};
</script>
