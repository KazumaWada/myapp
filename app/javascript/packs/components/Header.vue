//https://yacchi-engineer.com/?p=1010
<template>
  <header>
      <v-app-bar
        app
        dark
      >
      <!-- ハンバーガーを表示-->
      <v-app-bar-nav-icon @click="drawer = true"></v-app-bar-nav-icon>
        <v-toolbar-title>ベルリンなう</v-toolbar-title>
        <!-- ここからnavbar -->
        <v-tabs>
          <v-tab
            v-for="(menuItem, index) in menuItems"
            :key="index"
          >
            {{ menuItem.name }}
          </v-tab>
        </v-tabs>
      </v-app-bar>
      <!-- drawerの中身ここから -->
       <v-navigation-drawer
        v-model="drawer"
        fixed
        temporary
      >
      <!-- メニュー項目,リスト -->
        <v-list
          nav
          dense
        >
          <v-list-item-group>
        　 <v-list-item
    　 v-for="(menuItem, index) in menuItems"
      :key="index"
    >
    <!-- contants.jsにいき、name要素を取ってくる -->
      <v-list-item-title>{{ menuItem.name }}</v-list-item-title>
    </v-list-item>
          </v-list-item-group>
        </v-list>
      </v-navigation-drawer>
      <!-- drawerの中身ここまで -->
    </header>
</template>
<script>
// 下のmenuItemsに格納している
import constants from '../common/constants'
export default {
  data () {
    return {
      drawer: false,
      menuItems: constants.menuItems 
    }
  }
}
</script>
<style lang="scss" scoped>
.v-toolbar__title {
  overflow: visible !important;
  margin-right: 50px !important;
}
</style>