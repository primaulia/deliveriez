# DELIVERIEZ

## ERD

![ERD](/vendor/assets/images/erd.png "ERD")

## Changelogs
1. 30 Oct
   - Finalized on ERD structure
   - Creation of 2 models `Meal` & `DeliveryOrder`
   - Creation of seeds for previous 2 models
2. 31 Oct
   - Creation of test for `/orders` route
   - Creation of controllers `Orders`
   - Creation of route `/orders`
   - Update to the `seeds.rb`
3. 1 Nov
    - Creation of test for `/orders/:order_id` route
    - Creation of model `OrderItem`
    - Creation of route `/orders/:order_id`
    - Creation or relationship between `Meal` -> `OrderItem`
    - Creation or relationship between `DeliveryOrder` -> `OrderItem`
    - Update to the `seeds.rb`
4. 2 Nov
    - Refactoring on test, models, and controllers
    - Updates on `seeds.rb`
    - Implement `simplecov` for easy viewing on code coverage
