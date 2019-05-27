<template lang="pug">
  v-container(align-center justify-center row fill-height).pa-6.ma-6.dark.articles
    ul
      li(v-for="tag in tags")
        v-checkbox(v-model="checkedTags"
                  :value="tag.id"
                  :label="tag.title")
    ul
      li(v-for="post in filteredPlaces")
        span {{ post.title }}
</template>

<script>
export default {
  data: () => ({
    checkedTags: [],
    tags: [{
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
      tags: [{
        id: 1
      }]
    },
    {
      id: 2,
      title: 'Product 2',
      tags: [{
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
      tags: [{
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
        post.tags.some(tag =>
          this.checkedTags.includes(tag.id)
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
