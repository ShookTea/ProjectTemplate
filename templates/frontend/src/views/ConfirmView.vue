<template>
  <v-card class="ma-3">
    <v-card-title>
      <v-icon>mdi-account</v-icon>
      <span class="ml-2">Fill required data</span>
    </v-card-title>
    <v-card-text>
      {{ tokenData }}
    </v-card-text>
  </v-card>
</template>

<script lang="ts">
import Vue from 'vue';
import { mapGetters } from 'vuex';
import { decodeBase64Url } from '@/util/base64';

export default Vue.extend({
  name: 'ConfirmView',
  computed: {
    ...mapGetters({
      isLoggedIn: 'isLoggedIn'
    }),
    tokenData() : object {
      const token : string = this.$route.params.token;
      return this.decodeToken(token);
    },
  },
  methods: {
    decodeToken(token: string) : object {
      try {
        const elements = token.split('.');
        const body = elements[1];
        const json = decodeBase64Url(body);
        return JSON.parse(json);
      } catch (e) {
        this.$router.push('/');
        console.error(`Invalid token passed: ${token}`);
        return {};
      }
    }
  },
  mounted() {
    if(this.isLoggedIn) {
      console.log('Already logged in');
      this.$router.push('/');
    }
  },
});
</script>
