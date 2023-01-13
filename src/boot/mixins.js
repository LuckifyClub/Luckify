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
