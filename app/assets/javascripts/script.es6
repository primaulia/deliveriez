// 7 Nov, gotta change this to .es6 file. because heroku can't precompile es6 code

const orderResource = Vue.resource('/orders{/order_id}.json')
const feedbackByOrderResource = Vue.resource('/orders{/order_id}/feedbacks')

Vue.http.interceptors.push((request, next) => {
  const TOKEN = $('[name="csrf-token"]').attr('content')
  request.headers.set('X-CSRF-TOKEN', TOKEN)
  next()
})

Vue.component('modal', {
  props: ['order'],
  data: function () {
    return {
      feedbacks: this.order.feedbacks
    }
  },
  template: `
  <transition name="modal">
    <div class="modal-mask">
      <div class="modal-wrapper">
        <div class="modal-container">
          <div class="modal-header">
            <button class="modal-default-button" @click="$emit('close')">
              X
            </button>
            <!--div>
              <pre>{ {{ feedbacks }} }</pre>
            </div-->
            <slot name="header">
              default header
            </slot>
            <p>
              Your feedback will help us improve and design
              exciting new meals in the future
            </p>
            <p>
              Need help urgently? <a href="#">Send us an email</a>
              or call us at <a href="tel:+6531635335">+65 3163 5335</a>
            </p>
          </div>
          <div class="modal-body">
            <div>
              <button>All is good</button>

              <h3>How was the food?</h3>
              <ul>
                <li v-for="(meal, key) in order.order_items">
                  <div>
                    {{ meal.name }}
                    <label>
                      <input type="radio" :value="1" v-model="feedbacks[key + 1].rating">
                      Thumbs up
                    </label>
                    <label>
                      <input type="radio" id="mealDown" :value="-1" v-model="feedbacks[key + 1].rating">
                      Thumbs down
                    </label>
                  </div>
                  <input
                    type="text"
                    placeholder="Feel free to leave us a comment"
                    v-model="feedbacks[key + 1].comment"
                  >
                </li>
              </ul>
            </div>

            <div>
              <h3>How was our delivery?</h3>
              <label>
                <input type="radio" :value="1" v-model="feedbacks[0].rating">
                Thumbs up
              </label>
              <label>
                <input type="radio" :value="-1" v-model="feedbacks[0].rating">
                Thumbs down
              </label>
            </div>
          </div>
          <div class="modal-footer">
            <div>
              <input type="text" v-model="feedbacks[0].comment"
                     placeholder="Feel free to leave us a comment">
              <button @click="submitfeedback(order.order_id, feedbacks)">Submit</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </transition>
  `,
  methods: {
    submitfeedback: function (order_id, feedbacks) {
      feedbackByOrderResource.save({order_id}, {feedbacks}).then(response => {
        if(response.body.status === 'OK') this.$emit('close')
      })
    }
  }
})

Vue.component('order-list', {
  props: ['order'],
  template: `
    <li>
      <h2>{{ order.order_id }}</h2>
      <span v-if="order.feedback_submitted">Thank you!</span>
      <a href="#" v-else @click="$emit('open')">Submit feedback</a>
    </li>
  `
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
    retrieveOrderItem: function (order_id) {
      feedbackByOrderResource.get({order_id}).then(response => {
        this.order = response.body
        this.showModal = true
      })
    }
  }
})

// Define a new component called todo-item
