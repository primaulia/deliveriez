// 7 Nov, gotta change this to .es6 file. because heroku can't precompile es6 code

const orderResource = Vue.resource('/orders{/order_id}.json')
const feedbackByOrderResource = Vue.resource('/orders{/order_id}/feedbacks')

Vue.http.interceptors.push({
  request: function (request) {
    Vue.http.headers.common['X-CSRF-Token'] = $('[name="csrf-token"]').attr('content')
    return request
  },
  response: function (response) {
    return response
  }
})

Vue.component('modal', {
  props: ['orderItem'],
  template: `
  <transition name="modal">
    <div class="modal-mask">
      <div class="modal-wrapper">
        <div class="modal-container">
          <div class="modal-header">
            <button class="modal-default-button" @click="$emit('close')">
              X
            </button>
            <slot name="header">
              default header
            </slot>
            <p>
              Your feedback will help us improve and design
              exciting new meals in the future
            </p>
            <p>
              Need help urgently? <a href="#">Send us an email</a>
              or call us at <a href="tel:+6531635335">+65 3163 5335</>
            </p>
          </div>
          <div class="modal-body">
            <slot name="food">
              default body
            </slot>

            <slot name="delivery">
              default body
            </slot>
          </div>
          <div class="modal-footer">
            <slot name="footer">
              default footer
            </slot>
          </div>
        </div>
      </div>
    </div>
  </transition>
  `
})

Vue.component('order-list', {
  props: ['order'],
  template: `
    <li>
      <h2>{{ order.order_id }}</h2>
      <span v-if="order.feedback_submitted">Thank you!</span>
      <a href="#" v-else @click="$emit('open')">Submit feedback</a>
    </li>
  `,
  data: function() {
    return {
      counter: this.initialCounter
    }
  }
})

var app = new Vue({
  el: '#app',
  data: {
    orders: [],
    showModal: false,
    order: {},
    counter: 0
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
    retrieveOrderItem: function(given_order_id) {
      orderResource.get({order_id: given_order_id}).then(response => {
        this.order = response.body
        this.showModal = true
      })
    }
  }
})

// Define a new component called todo-item
