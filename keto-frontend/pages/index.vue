<template lang="pug">
  main
    hero(title='DIETA KETOGENICZNA', subtitle='ARTYKUŁY, BADANIA, PRZEPISY NIEZBĘDNE DO WEJŚCIA W ŚWIAT KETOZY')
    section.description
      .leading-text
        p But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him.
      button-small(url='#newsletter')
        span dołącz do nas
    hr
    section.featured-articles
      v-layout(row justify-space-between wrap)
        article-card
        article-card
        article-card
    hr
    section.newsletter#newsletter
      .contact-wrapper
        .contact-text
          .form-title INFO Z PIERWSZEJ RĘKI
          .form-text Zapisz się do newslettera aby otrzymywać co tygodniowe podsumowanie oraz informacje o naszych najnowszych produktach. Nie martw się, też nie cierpimy spamu. W każdej chwili możesz się wypisać.
        .contact-form
          v-form(
                ref="form")
            v-text-field(
              v-model="email"
              v-validate="'required|email'"
              :error-messages="errors.collect('email')"
              label="E-mail"
              data-vv-name="email"
              required
            )
            v-checkbox(
              v-model="checkbox"
              v-validate="'required'"
              :error-messages="errors.collect('checkbox')"
              value="1"
              label="Option"
              data-vv-name="checkbox"
              type="checkbox"
              required
            )
            v-btn(@click="submit") Zapisz się!
</template>

<script>
import Hero from '~/components/hero'
import ArticleCard from '~/components/article-card'
import ButtonSmall from '~/components/button-small'
export default {
  components: {
    Hero, ArticleCard, ButtonSmall
  },
  $_veeValidate: {
    validator: 'new'
  },
  computed: {
    binding() {
      const binding = {}
      if (this.$vuetify.breakpoint.mdAndUp) binding.column = true
      return binding
    }
  },
  data: () => ({
    email: '',
    checkbox: null
  }),
  mounted() {
    this.$validator.localize('en', this.dictionary)
  },
  methods: {
    submit() {
      this.$validator.validateAll()
    }
  }
  // pobieranie artykułów z json-server
  // async fetch({ store, params }) {
  //   await store.dispatch('GET_ARTICLES')
  // }
}
</script>

<style lang="sass">
  main
    position: relative
    background: $white
  li a
    text-decoration: none !important
  .description, .newsletter, .featured-articles
    min-height: 80vh
    width: 100vw
    background: white
    justify-content: center
    display: flex
    flex-direction: column
    align-items: center
    padding: 10rem
    position: relative
    @media screen and (max-width: 900px)
      padding: 3rem
  .leading-text
    text-align: center
    font-size: 1rem
  .contact-wrapper
    display: flex
    flex-direction: row
    float: center
  .contact-text
    width: 45%
  .form-title
    text-aling: left
    font-family: 'Futura PT'
    font-weight: 600
  .form-text
    font-family: 'OpenSans'
    font-size: 0.8rem
  .contact-form
    width: 45%
  hr
    width: 80vw
    border: 0
    height: 0
    border-top: 1px solid rgba(0, 0, 0, 0.1)
    border-bottom: 1px solid rgba(255, 255, 255, 0.3)
    margin-left: 10vw
</style>
