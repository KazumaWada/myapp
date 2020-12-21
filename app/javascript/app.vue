<template>
  <div id="app">
    <p>{{ message }}</p>
    <v-btn>Vuetifyのボタン</v-btn> <!-- 追加 -->
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello app!"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
