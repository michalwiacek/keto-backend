<template lang="pug">
  v-app
    Toolbar
    v-content.pa-0
      nuxt
    Footer
</template>

<script>
import Nav from './partials/nav'
import Toolbar from './partials/toolbar'
import Footer from './partials/footer'
export default {
  components: {
    Toolbar,
    Nav,
    Footer
  }
}
</script>

<style>
  html {
    font-family: 'Futura PT', 'Open Sans', sans-serif;
    font-size: 16px;
    word-spacing: 1px;
    -ms-text-size-adjust: 100%;
    -webkit-text-size-adjust: 100%;
    -moz-osx-font-smoothing: grayscale;
    -webkit-font-smoothing: antialiased;
    box-sizing: border-box;
  }

  *,
  *:before,
  *:after {
    box-sizing: border-box;
    margin: 0;
  }
  .page-enter-active, .page-leave-active {
    transition: all .25s ease-out;
  }
  .page-enter, .page-leave-to {
    opacity: 0;
    transform: scale(0.95);
    transform-origin: 50% 50%;
  }
</style>
