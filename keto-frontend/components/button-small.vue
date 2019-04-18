<template lang="pug">
  a(v-bind:href='url' class='button-small')
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
  .button-small
    position: relative
    font-weight: 600
    font-size: 0.9rem
    margin: 3rem 1rem 0 0
    padding: 0rem 0rem 0 -1rem
    color: $dark
    text-transform: uppercase
    box-shadow: 2px 2px 0 $rich-blue
    transition: all 0.15s ease
    &:hover
      background: $off-yellow
      color: $rich-blue
      box-shadow: 0px 0px 0 $dark
      top: 2px
      left: 2px
</style>
