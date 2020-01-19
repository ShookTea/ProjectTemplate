<template>
  <div class="d-flex justify-center align-center" style="height: 100%;">
    <v-card class="pa-10" outlined>
      <v-card-title>
        <v-icon>mdi-account</v-icon>
        <span class="ml-2">Login to TeamDriver</span>
      </v-card-title>
      <v-card-text class="mt-10">
        <v-text-field label="E-mail address" type="email" prepend-icon="mdi-at"/>
        <v-text-field label="Password" type="password" prepend-icon="mdi-key"/>
      </v-card-text>
      <v-card-actions>
        <v-btn color="primary" block>
          <v-icon>mdi-login</v-icon>
          <span class="ml-2">Login</span>
        </v-btn>
      </v-card-actions>
    </v-card>
  </div>
</template>

<script lang="ts">
import Vue from 'vue';

export default Vue.extend({
  name: 'LoginView'
});
</script>
