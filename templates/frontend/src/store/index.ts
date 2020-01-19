import Vue from 'vue';
import Vuex from 'vuex';
import Snackbar from './snackbar';
Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    /** @type {string} */
    accessToken: '',
  },
  getters: {
    /** @returns {boolean} */
    isLoggedIn(state) {
      return state.accessToken.length > 0;
    },
  },
  mutations: {},
  actions: {},
  modules: {
    Snackbar,
  },
});
