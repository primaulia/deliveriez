# [DELIVERIEZ](https://deliveriez.herokuapp.com/orders) [![Build Status](https://travis-ci.org/primaulia/deliveriez.svg?branch=master)](https://travis-ci.org/primaulia/deliveriez)

## ERD
![ERD](/vendor/assets/images/erd.png "ERD")

## Project Brief
- Create 3 models `DeliveryOrder`, `OrderItem`, `Meal`
- Create associations between the three models
- Create a seed data for the 3 different models
- Create 2 api endpoints `/orders` and `/orders/:order_id`
- Test using `rspec`

## Assumptions
- `order_id` is NOT the primary key of `DeliveryOrder` model
- `delivery_date` & `delivery_time` was derived from `DeliveryOrder` `serving_datetime` attributes
- `total_price` was derived from multiplying `quantity` * `unit_price`
- Accessing `/orders/:order_id` with invalid `order_id` will returned a json with a relevant error message
- The only active routes are these two routes only

## Setup
- Fork and clone this repo
- Open your terminal and run `rails:db create` to setup the database
- run `rails:db migrate` to migrate the db as per migration files
- run `rails:db seed` to seed the data
- run `rails s` to start the server
- (optional) run `rspec` to run the test

## Additional Gem
- [`pry`](https://github.com/pry/pry) - for better `rails console`
- [`faker`](https://github.com/stympy/faker) - for faking seed data
- [`shoulda`](https://github.com/thoughtbot/shoulda) - for a more ruby-esque test expectations
- [`factory_bot_rails`](https://github.com/thoughtbot/factory_bot_rails) - for easy test mocking
- [`simplecov`](https://github.com/colszowka/simplecov) - for a simple code coverage report

## Changelogs
1. **30 Oct**
   - Finalized on ERD structure
   - Creation of 2 models `Meal` & `DeliveryOrder`
   - Creation of seeds for previous 2 models
2. **31 Oct**
   - Creation of test for `/orders` route
   - Creation of controllers `Orders`
   - Creation of route `/orders`
   - Update to the `seeds.rb`
3. **1 Nov**
    - Creation of test for `/orders/:order_id` route
    - Creation of model `OrderItem`
    - Creation of route `/orders/:order_id`
    - Creation or relationship between `Meal` -> `OrderItem`
    - Creation or relationship between `DeliveryOrder` -> `OrderItem`
    - Update to the `seeds.rb`
4. **2 Nov**
    - Refactoring on test, models, and controllers
    - Updates on `seeds.rb`
    - Implement `simplecov` for easy viewing on code coverage
5. **3 Nov**
    - Cleaning up codes
    - Refactoring on tests and covering edge cases
    - Readme updates
    - Heroku deployment
6. **4 Nov**
    - Further test refactoring
    - Changing root route to `/orders` for heroku sake
    - Integration with Travis CI
    - Readme updates
