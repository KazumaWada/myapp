<template>
    <div id ="app"> 
      <Header />
      <!-- <router-view/> -->
     </div>
</template>
<script>
// 先にtemplate内にcomponentを書けば自動でimport,componentを記入してくれる
import Header from './packs/components/Header.vue'
export default {
  components: {
     Header
  },
}
</script>
