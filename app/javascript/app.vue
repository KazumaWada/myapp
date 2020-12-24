<template>
    <div id ="app"> 
      <Header />
      <Footer />
      <!-- <router-view/> -->
     </div>
</template>
<script>
// 先にtemplate内にcomponentを書けば自動でimport,componentを記入してくれる
import Header from './packs/components/Header.vue'
import Footer from './packs/components/Footer.vue'
export default {
  components: {
     Header,
     Footer
  },
}
</script>
