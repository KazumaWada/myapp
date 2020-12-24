<template>
  <v-footer padless>
    <v-col
      class="text-center"
      cols="12"
    >
      {{ new Date().getFullYear() }} — <strong>ベルリンなう</strong>
    </v-col>
  </v-footer>
</template>












//   <v-card>
//     <v-footer
//       v-bind="localAttrs"
//       :padless="padless"
//     >
//       <v-card
//         flat
//         tile
//         width="100%"
//         class="red lighten-1 text-center"
//       >
//         <v-card-text>
//           <v-btn
//             v-for="icon in icons"
//             :key="icon"
//             class="mx-4"
//             icon
//           >
//             <v-icon size="24px">
//               {{ icon }}
//             </v-icon>
//           </v-btn>
//         </v-card-text>

//         <v-divider></v-divider>

//         <v-card-text class="white--text">
//           {{ new Date().getFullYear() }} — <strong>Vuetify</strong>
//         </v-card-text>
//       </v-card>
//     </v-footer>

//   </v-card>
// </template>


//   export default {
//     data: () => ({
//       icons: [
//         'mdi-home',
//         'mdi-email',
//         'mdi-calendar',
//         'mdi-delete',
//       ],
//       items: [
//         'default',
//         'absolute',
//         'fixed',
//       ],
//       padless: false,
//       variant: 'default',
//     }),
//     computed: {
//       localAttrs () {
//         const attrs = {}

//         if (this.variant === 'default') {
//           attrs.absolute = false
//           attrs.fixed = false
//         } else {
//           attrs[this.variant] = true
//         }
//         return attrs
//       },
//     },
//   }
// </script>
