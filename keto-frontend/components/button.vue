<template lang="pug">
  a(v-bind:href='url' class='button')
    slot
</template>

<script>
export default {
  props: {
    text: String,
    url: String
  }
}
</script>

<style lang="sass">
  .button
    position: relative
    font-weight: 600
    font-size: 0.9rem
    margin: 3rem 7rem 0 0
    padding: 1.5rem 2.2rem
    background: $rich-blue
    color: $white
    text-transform: uppercase
    box-shadow: 2px 2px 0 $dark
    transition: all 0.15s ease
    &:hover
      background: $off-yellow
      color: $rich-blue
      box-shadow: 5px 5px 3px $dark
      top: -2px
      left: -2px
    &:active
      box-shadow: 0px 0px 0 $dark
      top: 5px
      left: 5px
</style>
