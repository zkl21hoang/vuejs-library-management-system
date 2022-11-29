import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import bookAdd from '../views/bookAdd.vue'
import bookSearch from '../views/bookSearch.vue'
import bookBorrow from '../views/bookBorrow.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/addabook',
    name: 'Add Book',
    component: bookAdd
  },
  {
    path: '/searchabook',
    name: 'Search Book',
    component: bookSearch
  },
  {
    path: '/borrowabook',
    name: 'Borrow Book',
    component: bookBorrow
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  }
]

const router = new VueRouter({
  routes
})

export default router
