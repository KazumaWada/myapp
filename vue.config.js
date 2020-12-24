module.exports = {
    transpileDependencies: [
      'vuetify'
    ],
    css: {
      loaderOptions: {
        scss: {
            prependData: '@import "./app/javascript/packs/styles/common/common.scss";'
        }
      }
    }
  }