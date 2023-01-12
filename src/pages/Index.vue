<template>
  <q-page class="luckpad column items-center">
    <div id="app" ref="container" class="flex justify-center full-width">
      <div class="container column full-width items-center q-mt-lg">

        <img alt="luckify logo" src="~assets/luckify-logo.svg" class="logoimg z-max q-my-xl" />
        <img alt="luckify logo" src="~assets/green-bg.svg" class="logobg absolute" />

        <div class="centrik z-max column items-center">
          <h1 class="flex no-wrap q-mx-xl fold">
            <div class="text-h1 fan text-bold text-no-wrap text-primary">Luckify is</div>
            <div class="text-h5 q-pa-md text-black">a platform that elevates the traditional lotto experience with its reliable
              onchain
              technology and with a bonus that's practically <span class="fan text-h3">unbeatable</span>, it's no wonder we're
              the go-to destination for
              players looking to <span class="fan text-h3">hit it big</span>.</div>
          </h1>

          <h2 class="fan text-h1 q-pa-none q-ma-none">When do we start to win?</h2>
          <div class="text-black">
            <p class="text-black text-center"><strong>Ticket on-sale date:</strong> February 01, 2023 20:00:00 UTC</p>
            <p class="text-black text-center">The first draw will take place <b>one week</b> after the sale starts.</p>
          </div>
          <countdown />
          <div>
            <p class="text-h6 text-center text-black">
              The time has come to start winning big. <br>
              Are you ready to join the coolest lotteries in the game? <br>
              The countdown is on - let's make it happen!</p>
          </div>
          <h2 class="fan text-h1 q-pa-none q-ma-none q-mt-xl">What is the difference?</h2>
          <div class="flex q-ma-xl row">
            <div class="box column items-center col-md col-xs-12">
              <h2 class="text-h4 q-pa-none q-ma-none text-center text-bold ">Unmanipulable and <br>Trusted Results</h2>
              <p class="text-h6 text-center info  text-black">Luckify uses Chainlink VRF, a secure blockchain
                application, to randomly select the winners, ensuring that the results are fair and cannot be
                manipulated. Trust in the integrity of our system is extremely important to us.</p>
              <img alt="chainlink logo" src="~assets/chainlink-logo.svg" class="q-ma-sm" />
            </div>



            <div class="box column items-center  col-md col-xs-12">
              <h2 class="text-h4 q-pa-none q-ma-none text-center text-bold">Big Prizes for <br>a Small Investment</h2>
              <p class="text-h6 text-center info  text-black">Our participation fee may be higher than other lotteries, but the
                probability of winning and the prize amount are also significantly higher. It is a unique opportunity to
                walk away with potentially life-changing winnings.</p>
            </div>

            <div class="box column items-center  col-md col-xs-12">
              <h2 class="text-h4 q-pa-none q-ma-none text-center text-bold">Privacy is <br> a Top Priority</h2>
              <p class="text-h6 text-center info  text-black">No participant will be asked to do KYC, and we will aim to have
                Luckify live as a complete degen play!</p>
            </div>
          </div>
          <h2 class="fan text-h1 q-pa-none q-ma-none q-mt-xl">Participation details</h2>
          <div>
            <div class="column flex-center text-h5 q-pa-xl">
              <div>For the first draw</div>
              <div class="q-px-xl q-mx-xl column flex-center full-width">
                <div class="flex justify-between full-width q-px-xl q-mx-xl bg-secondary rounded-borders q-mb-sm">
                  <b class="q-pr-sm">Participation fee:</b> 0.1 ETH (~ $120)
                </div>
                <div class="flex justify-between full-width q-px-xl q-mx-xl bg-secondary rounded-borders">
                  <b class="q-pr-sm">Number of tickets:</b> 10000
                </div>
              </div>
              <div class="text-body1">You can buy an unlimited number of tickets.</div>
            </div>
            <h3 class="q-pa-none q-ma-none text-center">Prizes*</h3>
            <div class="prizes flex flex-center q-mb-xl">

              <div class="column flex-center rounded-borders bg-luck q-px-md q-py-md q-ma-sm">
                <div class="text-h3 text-white">#2</div>
                <div class="text-body1 q-ma-none q-pa-none text-white">Prize</div>
                <div class="text-h2 q-ma-none q-pa-none text-bold text-white">150 ETH</div>
                <div class="text-body q-ma-none q-pa-none text-bold text-white">~$180.000</div>
              </div>
              <div class="column flex-center rounded-borders bg-luck q-px-md q-py-xl q-ma-sm">
                <div class="text-h3 text-white">#1</div>
                <div class="text-body1 q-ma-none q-pa-none text-white">Prize</div>
                <div class="text-h2 q-ma-none q-pa-none text-bold text-white">250 ETH</div>
                <div class="text-body q-ma-none q-pa-none text-bold text-white">~$300.000</div>
              </div>
              <div class="column flex-center rounded-borders bg-luck q-px-md q-py-xs q-ma-sm">
                <div class="text-h3 text-white">#3</div>
                <div class="text-body1 q-ma-none q-pa-none text-white">Prize</div>
                <div class="text-h2 q-ma-none q-pa-none text-bold text-white">100 ETH</div>
                <div class="text-body q-ma-none q-pa-none text-bold text-white">~$120.000</div>
              </div>

            </div>
            <div class="text-center">* Prizes will be awarded in percentage of tickets sold. The prizes shown are only eligible if all tickets are sold.</div>
          </div>
        </div>

        <div> <img alt="chainlink logo" src="~assets/LuckyFish.png" class="q-ma-sm luckyfish" /></div>

        <div class="column flex-center">
          <h2 class="fan text-h1 q-pa-none q-ma-none q-mt-xl">Faq</h2>
          <div class="text-h5 text-bold q-mt-lg">How does the lottery draw work?</div>
          <div class="q-px-xl q-mx-xl text-body1 text-center  text-black">
            Our lottery draw utilizes a secure blockchain application to randomly select the winner, ensuring that the
            results are fair and unmanipulable.
          </div>

          <div class="text-h5 text-bold q-mt-lg">How much does it cost to participate in the lottery?</div>
          <div class="q-px-xl q-mx-xl text-body1 text-center  text-black">
            The participation fee for our lottery may be higher than other lotteries, but the probability of winning
            and the prize amount are significantly higher as well.
          </div>

          <div class="text-h5 text-bold q-mt-lg">Is my personal information kept confidential?</div>
          <div class="q-px-xl q-mx-xl text-body1 text-center  text-black">
            Privacy is a top priority for our lottery. We understand that confidentiality is important to our players,
            and we take all necessary steps to protect your personal information. Rest assured that your information will
            be kept strictly confidential.
          </div>

          <div class="text-h5 text-bold q-mt-lg">Can I play the lottery from any location?</div>
          <div class="q-px-xl q-mx-xl text-body1 text-center  text-black">Yes, our lottery is open to players from any location.</div>

          <div class="text-h5 text-bold q-mt-lg">When will the next lottery draw take place?</div>
          <div class="q-px-xl q-mx-xl text-body1 text-center  text-black">
            The dates for our lottery draws are announced in advance on our website. Be sure to check back regularly
            for updates on the next draw.
          </div>
        </div>

      </div>

      <div class="full-width bg-primary text-secondary text-center text-h2 q-py-xl q-mt-xl text-bold">May the luck be
        with you!</div>

    </div>
  </q-page>
</template>

<script>

import countdown from '../components/countdown.vue';


export default {
  components: { countdown },
  name: 'PageIndex',
};
</script>


<style scoped>

/* .fold {max-width: 100vw;} */
.logoimg{max-height:16vh;}
h1{max-width:940px;}
.centrik{margin-top:10vh;}
.luckpad{max-width:1920px;background:url('~assets/rich-bg.png') no-repeat #D0EBDB;background-size:contain;margin:0 auto;box-shadow:0 0 100px -50px #000;}
.info{max-width:400px;margin:2vh auto 1vh auto;padding:0 1.9vh;}
.box{padding:20px;margin:20px;width:100%;border-radius:40px;box-shadow:0 10px 30px -15px #000;background:#ebfcef;}
.prizes{align-items:flex-end;}
.prizes .bg-luck{background-image: linear-gradient(
  0deg,
  hsl(127deg 38% 34%) 0%,
  hsl(127deg 39% 31%) 34%,
  hsl(127deg 41% 29%) 59%,
  hsl(127deg 43% 26%) 77%,
  hsl(107deg 44% 30%) 88%,
  hsl(80deg 60% 36%) 94%,
  hsl(61deg 82% 39%) 98%,
  hsl(49deg 100% 50%) 100%
);}
.luckyfish {max-height: 50vh;}


/* .logo {width: 100%; background: url('~assets/green-bg.svg') no-repeat;} */
</style>
