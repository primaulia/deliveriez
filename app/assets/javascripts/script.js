Vue.http.interceptors.push({
  request: function (request) {
    Vue.http.headers.common['X-CSRF-Token'] = $('[name="csrf-token"]').attr('content')
    return request
  },
  response: function (response) {
    return response
  }
})

// Define a new component called todo-item
Vue.component('order_list', {
  props: ['order'],
  template: `
    <li>
      <h2>{{ order.order_id }}</h2>
      <span v-if="order.feedback_submitted">Thank you!</span>
      <a href="#" v-else>Submit feedback</a>
    </li>`
})

var orderResource = Vue.resource('/orders{/id}.json')

var app = new Vue({
  el: '#app',
  data: {
    orders: []
  },
  mounted: function () {
    this.retrieveOrders()
  },
  methods: {
    retrieveOrders: function () {
      orderResource.get().then(response => {
        this.orders = response.body.orders
      })
    },
    modal: function (order_id) {
      console.log(`test ${order_id}`)
    }
  }
})
