import Vuex from 'vuex';

interface SnackbarMessage {
  text: string,
  color: string
}

interface VuexSnackbarState {
  snackbarMessages: Array<SnackbarMessage>,
}

const state : VuexSnackbarState = {
  snackbarMessages: []
};

export default new Vuex.Store({
  state,
  mutations: {
    addSnackbarMessage(state : VuexSnackbarState, message : SnackbarMessage) : void {
      state.snackbarMessages.push(message);
    }
  },
});
