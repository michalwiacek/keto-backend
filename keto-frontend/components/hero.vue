<template lang="pug">
  section(id="hero" class="hide-overflow").hero
    .hero-inner
      .hero-title {{title}}
      .hero-subtitle {{subtitle}}
      .button-wrapper
        Button(url='/recipes')
          span poznaj przepisy
        Button(url="/shop")
          span kup artykuły
</template>

<script>
import Button from './button'
export default {
  components: {
    Button
  },
  props: {
    title: String,
    subtitle: String
  }
}
</script>

<style lang="sass">
  .hero
    width: 100vw
    height: 100vh
    display: flex
    align-items: center
    text-align: justify
    color: white
    min-height: 500px
    font-family: 'futura pt'
    background-image: linear-gradient(rgba(0, 0, 0, 0.5),rgba(0, 0, 0, 0.5)), url('~assets/img/karma.jpeg')
    background-size: cover
    background-position: center center
    background-repeat: no-repeat
  .hero-title
    font-weight: 800
    font-size: 4rem
    line-height: 3
    @media screen and (max-width: 900px)
      font-size: 3rem
  .hero-subtitle
    font-weight: 500
    font-size: 1.3rem
    @media screen and (max-width: 900px)
      padding-right: 3rem
  .hero-inner
    margin: 3rem
    padding-left: 6rem
    padding-top: 140px
    @media screen and (max-width: 900px)
      padding-left: 0.3rem
      padding-top: 0.3rem
  .button-wrapper
    display: flex
    flex-direction: row
</style>
