<template lang="pug">
nav
  v-toolbar(app
            v-scroll="onScroll"
            :class="isTransparent ? 'toolbar' : 'toolbar-yellow'"
            :height="isTransparent ? 100 : 100"
            :dark="isTransparent ? true : false"
            flat).top-nav.toolbar
    v-toolbar-side-icon(white--text @click.stop="mobileMenu=!mobileMenu" class="hidden-md-and-up")
    v-spacer
    v-spacer(class="hidden-sm-and-down")
      v-btn.buttons(flat small nuxt to="/articles") wpisy
      v-btn.buttons(flat to="/recipes") przepisy
    v-toolbar-title
      v-btn.logo(flat to="/") ketowcy
    v-spacer
    v-spacer(class="hidden-sm-and-down")
      v-btn.buttons(flat to="") Join Us
        v-icon(right) exit_to_app
  v-navigation-drawer(app disable-resize-watcher v-model="mobileMenu" class="white")
    v-btn.leftMenuButton(@click="mobileMenu=false")
      v-icon cancel
    v-btn.leftMenuButton(flat to="/articles") wpisy
    v-btn.leftMenuButton(flat to="/recipes") przepisy
    v-btn.leftMenuButton(flat to="") Join us
      v-icon(right) exit_to_app
</template>
<script>
export default {
  components: {
  },
  data: () => ({
    mobileMenu: false,
    isTransparent: true,
    items: ['kategoria1', 'kategoria2', 'kategoria3']
  }),
  methods: {
    onScroll() {
      const breakPoint = window.innerWidth >= 450 ? 150 : 10
      this.isTransparent = window.pageYOffset < breakPoint
    }
  }
}
</script>

<style lang="sass" scoped>
  .v-toolbar
    transition: all 0.25s ease-out
  // .buttons
  //   font-size: 1.2rem
  //   font-weight: bold
  //   letter-spacing: 0.1rem
  .leftMenuButton
    width: 100%
    font-size: 1rem
    letter-spacing: 0.1rem
    margin: 0
  .toolbar-yellow
    background: $off-yellow !important
    color: $rich-blue !important
  .toolbar
    font-family: 'futura pt'
    display: flex
    position: fixed
    justify-content: space-evenly
    align-items: center
    background: transparent
    height: 100px
    width: 100vw
    z-index: 3
    color: $white
    &:hover
      background: $off-yellow
      color: $rich-blue
    .logo
      font-size: 3.5rem
      font-weight: 600
    .menu
      font-size: .8rem
      font-weight: 600
      display: flex
      text-transform: uppercase
      justify-content: space-between
    .menu-drop, .menu-icon
      margin: 0 20px 0 0
</style>
