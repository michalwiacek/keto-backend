<template>
  <div class="text-xs-center">
    <v-menu open-on-hover top offset-y>
      <template v-slot:activator="{ on }">
        <v-btn
          color="primary"
          dark
          v-on="on"
        >
          Dropdown
        </v-btn>
      </template>

      <v-list>
        <v-list-tile
          v-for="(item, index) in articles"
          :key="index"
          @click="on"
        >
          <v-list-tile-title>{{ item.title }}</v-list-tile-title>
        </v-list-tile>
      </v-list>
    </v-menu>
  </div>
</template>

<script>
  export default {
    data: () => ({
      articles: [
        { title: 'wege' },
        { title: 'products' },
        { title: 'sport' },
        { title: 'knowledge' },
        { title: 'get started' },
        { title: 'tips&tricks' },
        { title: 'news' }
      ]
    })
  }
</script>