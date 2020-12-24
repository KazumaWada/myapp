


-------------------------------------------------------------------

 元々のhome


// https://vuetifyjs.com/ja/components/cards/#grids
// https://vuetifyjs.com/ja/components/hover/#section-30db30d030fc30ea30b930c8
// https://vuetifyjs.com/ja/components/images/#section-30b030ea30c330c9
// https://vuetifyjs.com/ja/components/overlays/#section-4e0a7d1a
// https://vuetifyjs.com/ja/components/subheaders/#social-media


<template>
  <v-container class="grey lighten-5">
    <v-row no-gutters>
      <v-col
        cols="16"
        md="8"
      >
        <v-card
          class="pa-2"
          outlined
          tile
        >
        <!-------------------- ここから入力.col-6 .col-md-4 -------------->
           <v-card
    flat
    tile
    fluid
  >
     <v-container
      v-for="type in types"
      :key="type"
      class="grey lighten-4"
      fluid
    >
      <v-subheader>{{ type }}</v-subheader>

      <v-row>
        <v-spacer></v-spacer>
        <v-col
          v-for="card in cards"
          :key="card"
          cols="12"
          sm="6"
          md="4"
        >
          <v-card>
            <v-img
              :src="`https://picsum.photos/200/300?image=${getImage()}`"
              height="300px"
            >
              <span
                class="headline white--text pl-4 pt-4 d-inline-block"
                v-text="card"
              ></span>
            </v-img>

            <v-card-actions class="white justify-center">
              <v-btn
                v-for="(social, i) in socials"
                :key="i"
                :color="social.color"
                class="white--text"
                fab
                icon
                small
              >
                <v-icon>{{ social.icon }}</v-icon>
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
      </v-card>
　　　　　<!-------------------------- ここまで入力--------------------- -->
        </v-card>

     <!-- right -->
      </v-col>
      <v-col
        cols="2"
        sm="2"
        md="0"
      >
        <v-card
          class="pa-2"
          outlined
          tile
        >
        <!------------ ここから入力 .col-12 .col-sm-6 .col-md-8 --------------->
       <!-- <v-col cols="2"> -->
            <v-sheet rounded="lg">
              <v-list color="transparent">
                <v-list-item
                  v-for="n in 5"
                  :key="n"
                  link
                >
                  <v-list-item-content>
                    <v-list-item-title>
                      List Item {{ n }}
                    </v-list-item-title>
                  </v-list-item-content>
                </v-list-item>

                <v-divider class="my-2"></v-divider>

                <v-list-item
                  link
                  color="grey lighten-4"
                >
                  <v-list-item-content>
                    <v-list-item-title>
                      タグ一覧
                      <i class="fas fa-tag"></i>
                    </v-list-item-title>
                  </v-list-item-content>
                </v-list-item>
              </v-list>
            </v-sheet>
          <!-- </v-col> -->
          <!-- <v-col> -->
        <!---------------------- ここまで入力 -------------------------->
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>
<script>
  export default {
    data: () => ({
      types: ['Places to Be', 'Places to See'],
      cards: ['Good', 'Best', 'Finest'],
      socials: [
        {
          icon: 'mdi-facebook',
          color: 'indigo',
        },
        {
          icon: 'mdi-linkedin',
          color: 'cyan darken-1',
        },
        {
          icon: 'mdi-instagram',
          color: 'red lighten-3',
        },
      ],
    }),

    methods: {
      getImage () {
        const min = 550
        const max = 560

        return Math.floor(Math.random() * (max - min + 1)) + min
      },
    },
  }
</script>
