import Vue from 'vue';

export const env = {
  name: process.env.NODE_ENV,
  production: process.env.NODE_ENV === 'production',
  dev: process.env.NODE_ENV === 'development',
  test: process.env.NODE_ENV === 'test',
  debug: ['development'].includes(process.env.NODE_ENV),
  MOCK:
    !!(process.env.NODE_ENV === 'development' || process.env.NODE_ENV === 'test'),
  console:
    process.env.NODE_ENV === 'development' || process.env.NODE_ENV === 'test'
      ? console
      : {
        log: () => null,
        warn: () => null,
        error: () => null,
        info: () => null,
        table: () => null,
      },
};

Vue.prototype.$env = env;
Vue.$env = env;

export default env;
