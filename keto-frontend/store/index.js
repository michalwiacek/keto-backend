import axios from 'axios'

// process.env.CLIENT_URL <- dodać obsługę ENV
const apiUrl = 'http://localhost:4000'

export const state = () => ({
  articles: []
})

export const actions = {
  async GET_ARTICLES({ commit }) {
    const { data } = await axios.get(`${apiUrl}/articles`)
    commit('SET_ARTICLES', data)
  }
}
export const mutations = {
  SET_ARTICLES(state, articles) {
    state.articles = articles
  }
}
