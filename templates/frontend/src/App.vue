<template>
  <v-app>
    <v-app-bar app color="primary">
      <div class="d-flex align-center headline font-weight-thin">
        <v-img alt="TeamDriver" class="shrink mr-2" src="/logo.png" transition="scale-transition" width="40" contain/>
        <span style="font-variant: small-caps">TeamDriver</span>
      </div>
      <v-spacer/>
      <login-button/>
    </v-app-bar>
    <v-content class="secondary lighten-3">
      <router-view/>
      <status-snackbar>
    </v-content>
  </v-app>
</template>

<script lang="ts">
import Vue from 'vue';
import LoginButton from '@/components/dashboard/LoginButton.vue';
import StatusSnackbar from '@/components/dashboard/StatusSnackbar.vue';

export default Vue.extend({
  name: 'App',
  components: {
    LoginButton,
    StatusSnackbar,
  },
  data: () => ({
    loggedIn: false,
  }),
});
</script>
