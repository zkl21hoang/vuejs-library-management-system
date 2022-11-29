<template>
  <v-app id="inspire">
    <v-navigation-drawer
    v-model="drawer"
    app
    >
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title class="text-h6">
            zkL Library
          </v-list-item-title>
          <v-list-item-subtitle>
            Best Library in Swinburne University
          </v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>

      <v-divider></v-divider>

      <v-list
        dense
        nav
      >
        <v-list-item
          v-for="item in items"
          :key="item.title"
          :to="item.to"
          link
        >
          <v-list-item-icon>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

     <v-app-bar
      app
      color="green darken-1"
      dark
    >
      <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>

      <v-app-bar-title>Library</v-app-bar-title>

      <v-spacer></v-spacer>

    </v-app-bar>

    <v-main>
      <router-view></router-view>
    </v-main>
  </v-app>
</template>

<script>
  export default {
    data: () => ({ drawer: null,
            items: [
          { title: 'Home', icon: 'mdi-home-variant', to: '/' },
          { title: 'Search your books', icon: 'mdi-book-search', to: '/searchabook' },
          { title: 'Add a book', icon: 'mdi-book-plus-outline', to: '/addabook' },
          { title: 'Borrow a book', icon: 'mdi-book-education', to: '/borrowabook' },
          { title: 'About', icon: 'mdi-help-box', to: '/about' }
        ], 
    }),
  }
</script>