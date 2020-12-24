<template>
    <div id ="app"> 
      <Header />
      <!-- <Nav /> -->
      <Home />
      <Footer />
      <!-- <router-view/> -->
     </div>
</template>
<script>
// 先にtemplate内にcomponentを書けば自動でimport,componentを記入してくれる
import Header from './packs/components/Header.vue'
import Footer from './packs/components/Footer.vue'
// import Nav from './packs/components/Nav.vue'
import Home from './packs/pages/Home.vue'
export default {
  components: {
     Header,
     Footer,
     Home,
    //  Nav
  },
}
</script>
