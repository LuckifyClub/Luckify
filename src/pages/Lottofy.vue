<template>
  <q-page class="aller">
    <!-- <div class="connector q-ma-md z-max" :class="od('absolute-right') + om('absolute-center-top')">
      <div v-if="web3">
        <q-btn class="q-ml-sm" v-if="!account" :disable="!provider" @click="CONNECT_CLICK" color="primary">Connect</q-btn>
        <q-btn class="q-ml-sm" v-if="account" color="primary">{{ maskWalletAddress(account) }}</q-btn>
        <q-btn class="q-ml-sm" v-if="account" color="primary" @click="GET_TICKET_CLICK">Get Ticket</q-btn>
      </div>
      <div v-else class="bg-red">No web3 detected. Please install https://metamask.io/</div>
    </div> -->

    <div id="app" ref="container" class="luckpad" :class="om('full-width')">
      <div class="flex column items-center full-width">
        <div class="container flex full-width items-center justify-center" :class="od('row') + om('column')">
          <div class="flex row q-mx-xl full-width items-baseline justify-center">
            <img alt="luckify logo" src="~assets/luckify-logo.svg" class="logoimg z-max q-my-xl" :class="od('') + om('full-width')" />
            <div class="text-h1 q-ma-xl">X</div>
            <img alt="lottofy logo" src="~assets/lottofy-logo.svg" class="logoimg z-max q-my-xl" :class="od('') + om('full-width')" />
          </div>

          <div class="game-cards row justify-center items-center full-width q-mb-xl">
            <div v-for="game in games" :key="game.id" class="game-card col-3 q-pa-md q-ma-md bg-white">
              <div class="flex column justify-center items-center relative-position">
                <div class="gameid text-h5 absolute-top-right z-max bg-white q-pa-sm">
                  #<span>{{ game.id }}</span>
                </div>
                <!-- src="https://cdn.discordapp.com/attachments/1106475015823708231/1116774735393591406/jeg_Big_golden_winner_98b70eec-d40c-41eb-b826-36194aa0bb7d.png" -->
                <q-img
                  alt=""
                  :src="game.image"
                  contain
                  class="gameimg z-top q-mb-md bg-green full-width rounded-borders"
                  :class="od('') + om('full-width')"
                  :ratio="16 / 9"
                />
                <div class="text-h4 q-mb-md text-center">{{ game.title }}</div>

                <div class="datearea flex full-width q-px-lg">
                  <div class="date start flex justify-between full-width">
                    <div class="title">Start Date</div>
                    <!-- <div class="desc">June 20, 2023</div> -->
                    <div class="desc">{{ epocToDate(game.start_date) }}</div>
                  </div>
                  <div class="date end flex justify-between full-width">
                    <div class="title">End Date</div>
                    <!-- <div class="desc">June 27, 2023</div> -->
                    <div class="desc">{{ epocToDate(game.end_date) }}</div>
                  </div>
                </div>

                <div class="ticketarea flex full-width q-px-lg q-my-md">
                  <div class="ticket price flex justify-between full-width">
                    <div class="title">Total ticket count</div>
                    <div class="desc">
                      10.000/<span class="text-h6">{{ game.ticket_count }}</span>
                    </div>
                  </div>
                  <div class="ticket count flex justify-between full-width text-h6">
                    <div class="title">Ticket price</div>
                    <div class="desc">{{ game.ticket_price }} ETH</div>
                  </div>
                </div>

                <div class="btnarea q-px-lg q-mb-md">
                  <div class="ticketconut bg-green-2 q-pa-md q-mb-md rounded-borders">
                    <div class="text-center text-bold q-mb-sm">Choose quantity to buy</div>
                    <div class="flex ticketcount text-h5 wrap row">
                      <button @click="decrement(game)" class="col-2">-</button>
                      <input type="text" v-model="game.number" @keypress="checkNumericInput" class="text-center col-8" />
                      <button @click="increment(game)" class="col-2">+</button>
                    </div>
                  </div>
                  <button class="buybtn full-width text-h5 bg-primary text-secondary flex justify-between q-pa-md rounded-borders">
                    <span>BUY</span>
                    <span class="text-bold">{{ (game.number * game.ticket_price).toFixed(4) }} ETH</span>
                  </button>
                </div>
              </div>
            </div>
          </div>

          <div class="mytickets q-px-xl full-width game-cards q-mb-xl">
            <div class="flex game-card full-width bg-white q-pa-xl column">
              <div class="text-h5 text-bold">MY TICKETS</div>
              <table class="text-left full-width text-h6">
                <tr>
                  <th>Game name</th>
                  <th>Game id</th>
                  <th>Total Quantity</th>
                  <th class="text-right">Won</th>
                </tr>
                <tr>
                  <td>Time to Love</td>
                  <td>#12</td>
                  <td>14</td>
                  <td class="text-right">Sorry...</td>
                </tr>
                <tr>
                  <td>Bright Future</td>
                  <td>#78</td>
                  <td>98</td>
                  <td class="text-right">
                    You win <span class="text-bold">86</span> ETH
                    <button class="buybtn bg-primary text-secondary q-pa-xs rounded-borders q-ml-lg">Claim</button>
                  </td>
                </tr>
                <tr>
                  <td>Running Horses</td>
                  <td>#92</td>
                  <td>15</td>
                  <td class="text-right">Sorry...</td>
                </tr>
              </table>
            </div>
          </div>
        </div>

        <div class="full-width bg-primary text-secondary text-center text-h2 q-py-xl text-bold">
          <div>May the luck be with you!</div>
          <div class="smicons">
            <a href="https://t.me/luckifyclub" target="_blank"><img src="~assets/sm-telegram.svg" alt="LUCKIFY Telegram" /></a>
            <a href=" https://twitter.com/luckifyclub" target="_blank"><img src="~assets/sm-twitter.svg" alt="LUCKIFY Twitter" /></a>
          </div>
        </div>
      </div>
    </div>
  </q-page>
</template>

<script>
import { mapState, mapGetters } from 'vuex';
import { dialog } from 'src/misc/dialog';
import { ethers } from 'ethers';
import Web3 from 'web3';
import { Network, Alchemy } from 'alchemy-sdk';
import { GAME_ABI, CONTRACT_ADDRESS, CURRENT_RPC, RPC } from 'src/misc/globals.js';

export default {
  data() {
    return {
      number: 5,

      games: [],

      // info: {
      //   id: '3',
      //   title: 'Deneme3',
      //   image: 'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png',
      //   ticket_count: '20',
      //   ticket_price: '0.01',
      //   start_date: '1682140437',
      //   end_date: '1682144037',
      //   award_ratio_list: '30, 10, 5',
      //   payoff_count: '10',
      //   payoff_ratio: '1',
      //   marketing_ratios: '20',
      //   marketing_addresses: '0x4b8F3c2e26F057732bD5df4F07C33b001d82E40D, 0x1719fF78022C747FC6eD6ab8F7ce788b7a9c73E6',
      // },
    };
  },

  computed: {
    ...mapState('app', ['web3', 'account', 'balance']),
    ...mapGetters('app', ['getProvider']),
  },

  async mounted() {
    for (let i = 0; i < 10; i += 1) {
      try {
        const game = await this.GET_INSTANCE(i + 1);
        this.games.push({ ...game, number: 5 });
      } catch (error) {
        break;
      }
    }
  },

  methods: {
    epocToDate(epochTime) {
      const date = new Date(epochTime);
      const localeDate = date.toLocaleString();
      return localeDate;
    },

    checkNumericInput(event) {
      const charCode = event.which ? event.which : event.keyCode;
      if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        event.preventDefault();
      }
    },
    increment(game) {
      game.number = parseInt(game.number) + 1;
    },
    decrement(game) {
      if (parseInt(game.number) > 0) {
        game.number = parseInt(game.number) - 1;
      }
    },

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
  },
};
</script>

<style scoped>
.logoimg {
  max-height: 16vh;
  max-width: 300px;
}
h1 {
  max-width: 46vw;
}

.aller {
  display: flex;
  position: relative;
  justify-content: center;
  align-items: center;
  width: 100vw;
  height: 100vh;
  background: url('~assets/rich-bg-2.png') no-repeat;
  overflow: hidden;
  background-size: cover;
  background-position: center top;
}

.luckpad {
  position: relative;
  display: flex;
  align-items: self-start;
  width: 94vw;
  height: 90vh;
  overflow-y: overflow;
  overflow-x: hidden;
  background: #e1ffdbb8;
  background-size: contain;
  box-shadow: 0 0 100px -20px #000;
  border: 2px solid white;
  border-radius: 50px 10px 10px 50px;
  backdrop-filter: blur(10px);
}

.gameid {
  top: -25px;
  right: 25px;
  box-shadow: 0 5px 25px -5px #000;
  border-radius: 10px;
  font-weight: 600;
}
.desc {
  font-weight: 900;
}
.date {
  background: #f0faf3;
  margin-bottom: 10px;
  padding: 3px 5px;
}

.smicons {
  padding: 10px;
  border-radius: 20px;
}
.smicons a {
  margin: 8px;
}
.smicons a img {
  max-height: 55px;
  height: 55px;
  border-radius: 5px;
  padding: 8px;
  transition: all 0.5s ease;
}
.smicons a:hover img {
  background: #202d23;
}

.game-cards {
  max-width: 1900px;
}
.game-card {
  border-radius: 1em;
}

.mytickets table tr:nth-child(even) {
  background-color: #f2f2f2;
}
.mytickets table th,
.mytickets table td {
  padding: 10px;
}

/* .logo {width: 100%; background: url('~assets/green-bg.svg') no-repeat;} */

@media (max-width: 600px) {
  .luckpad {
    width: 100vw;
    height: 100vh;
    border: none;
    border-radius: 0;
    overflow: overlay;
  }
}
</style>
