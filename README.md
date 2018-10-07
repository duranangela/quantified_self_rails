# README

## Welcome to Quantified Self: Rails Version!

This project is the backend api for a simple calorie counter application. The associated front end would have a user interface for interacting with the database. The front end application would make api calls to this api. This project uses rails 5.2.1, and ruby version 2.4.1.

This project is hosted at https://safe-meadow-38058.herokuapp.com/

The endpoints are as follows:

`GET /api/v1/foods` - returns all foods in the database
`GET /api/v1/foods/:id` - returns food with specified id
`POST /api/v1/foods` - creates a new food in the database with parameters `{ "food": { "name": "Name of food here", "calories": "Calories here"} }`
`PATCH /api/v1/foods/:id` - updates an existing food with aforementioned parameters
`DELETE /api/v1/foods/:id` - deletes the food with specified id
`GET /api/v1/meals` - returns all meals in the database with associated foods
`GET /api/v1/meals/:meal_id/foods` - returns all foods associated with the meal with associated id
`POST /api/v1/meals/:meal_id/foods/:id` - add the food with :id to the meal with :meal_id
`DELETE /api/v1/meals/:meal_id/foods/:id` - removes the food with :id from the meal with :meal_id
`GET /api/v1/favorite_foods` - retrieves data on the foods which were eaten most frequently


If you would like to clone down this repository yourself, please do so and then follow these steps:
```
bundle
rake db:create
rake db:migrate
```

You will then be able to manipulate the database through rails console or through the endpoints via localhost:3000.

If you would like to run the test suite, please run `rspec` or `bundle exec rspec`.
