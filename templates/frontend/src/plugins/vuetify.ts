import Vue from 'vue';
import Vuetify from 'vuetify';
import 'vuetify/dist/vuetify.min.css';

Vue.use(Vuetify);

export default new Vuetify({
  theme: {
    themes: {
      light: {
        primary: {
          lighten3: '#FFFFC3',
          lighten2: '#D9FF87',
          lighten1: '#A6DE4B',
          base: '#73AC0F',
          darken1: '#407C00',
          darken2: '#0D4C00',
          darken3: '#001C00',
        },
        secondary: {
          lighten3: '#E7FCFF',
          lighten2: '#9FCEFF',
          lighten1: '#57A0DE',
          base: '#0F72AC',
          darken1: '#00477C',
          darken2: '#001C4C',
          darken3: '#00001C',
        },
      },
    },
  },
});
