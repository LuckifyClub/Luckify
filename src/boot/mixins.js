import env from 'src/misc/environment';

export default async ({ Vue /* app, router, Vue, ... */ }) => {
  Vue.mixin({
    computed: {
      MOBILE() {
        return this.$q.platform.is.mobile;
      },

      DESKTOP() {
        return this.$q.platform.is.desktop;
      },
    },

    methods: {
      maskWalletAddress(address) {
        return `${address.substring(0, 6)}...${address.substring(address.length - 4, address.length)}`;
      },

      od(val) {
        return this.$q.platform.is.desktop ? ` ${val} ` : ' ';
      },
      om(val) {
        return this.$q.platform.is.mobile ? ` ${val} ` : ' ';
      },
      md(valMobile, valDesktop) {
        return this.$q.platform.is.mobile ? ` ${valMobile} ` : ` ${valDesktop} `;
      },
    },
  });
};
