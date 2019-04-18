<template lang="pug">
  v-container(align-center justify-center row fill-height).pa-6.ma-6.dark.articles
    ul
      li(v-for="eatCategory in eatCategories")
        v-checkbox(v-model="checkedEatCategories"
                  :value="eatCategory.id"
                  :label="eatCategory.title")
    ul
      li(v-for="post in filteredPlaces")
        span {{ post.title }}
</template>

<script>
export default {
  data: () => ({
    checkedEatCategories: [],
    eatCategories: [{
      id: 1,
      title: 'Category 1'
    }, {
      id: 2,
      title: 'Category 2'
    }, {
      id: 3,
      title: 'Category 3'
    }, {
      id: 4,
      title: 'Category 4'
    }, {
      id: 5,
      title: 'Category 5'
    }],
    posts: [{
      id: 1,
      title: 'Product 1',
      eat_categories: [{
        id: 1
      }]
    },
    {
      id: 2,
      title: 'Product 2',
      eat_categories: [{
        id: 1
      },
      {
        id: 2
      },
      {
        id: 3
      }
      ]
    },
    {
      id: 3,
      title: 'Product 3',
      eat_categories: [{
        id: 1
      },
      {
        id: 5
      }
      ]
    }
    ]
  }),
  computed: {
    filteredPlaces: function () {
      return this.posts.filter(post =>
        post.eat_categories.some(tag =>
          this.checkedEatCategories.includes(tag.id)
        )
      )
    }
  }
}
</script>

<style lang="sass">
  .articles
    background: grey
</style>
