<template>
    <div class="flex mono text-primary non-selectable">
        <div class="box q-ma-sm q-pa-md column items-center ">
            <div :class="od('text-h1')+om('text-h3')">{{ days.toString().padStart(2, '0')  }} </div>   <div class="desc">days</div>
        </div>
        <div class="box q-ma-sm q-pa-md column items-center ">
            <div :class="od('text-h1')+om('text-h3')">{{ hours.toString().padStart(2, '0')  }} </div>  <div class="desc">hours</div>
        </div>
        <div class="box q-ma-sm q-pa-md column items-center ">
            <div :class="od('text-h1')+om('text-h3')">{{ minutes.toString().padStart(2, '0')  }}</div> <div class="desc">minutes</div>
        </div>
        <div class="box q-ma-sm q-pa-md column items-center ">
            <div :class="od('text-h1')+om('text-h3')">{{ seconds.toString().padStart(2, '0')  }}</div> <div class="desc">seconds</div>
        </div>
    </div>
</template>

<style scoped>

.box {background: #fff; border-radius: 10px;}
.desc {font-size: 1rem;}

.text-h1 {line-height: 1 !important;}

</style>

<script>

export default {
  data() {
    return {
      endDate: '2023-05-15 20:00:00', // fixed date to countdown to in UTC time
      days: 0,
      hours: 0,
      minutes: 0,
      seconds: 0,
    };
  },
  mounted() {
    this.countdown();
    setInterval(this.countdown, 1000);
  },
  methods: {
    countdown() {
      const currentTime = new Date();
      const endTime = new Date(Date.UTC(
        parseInt(this.endDate.substring(0, 4)), // year
        parseInt(this.endDate.substring(5, 7)) - 1, // month (0-11)
        parseInt(this.endDate.substring(8, 10)), // day
        parseInt(this.endDate.substring(11, 13)), // hour
        parseInt(this.endDate.substring(14, 16)), // minute
        parseInt(this.endDate.substring(17, 19)), // second
      ));
      const timeDifference = endTime - currentTime;

      if (timeDifference > 0) {
        this.days = Math.floor(timeDifference / 1000 / 60 / 60 / 24);
        this.hours = Math.floor(timeDifference / 1000 / 60 / 60) % 24;
        this.minutes = Math.floor(timeDifference / 1000 / 60) % 60;
        this.seconds = Math.floor(timeDifference / 1000) % 60;
      } else {
        this.days = 0;
        this.hours = 0;
        this.minutes = 0;
        this.seconds = 0;
      }
    },
  },
};
</script>
