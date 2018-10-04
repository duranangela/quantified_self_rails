# README

## Welcome to Quantified Self: Rails Version!

This project is the backend api for a simple calorie counter application. The associated front end would have a user interface for interacting with the database. The front end application would make api calls to this api. This project uses rails 5.2.1, and ruby version 2.4.1.

This project is hosted at https://safe-meadow-38058.herokuapp.com/

The endpoints built so far are as follows:
```
GET /api/v1/foods
GET /api/v1/foods/:id
POST /api/v1/foods
PATCH /api/v1/foods/:id
DELETE /api/v1/foods/:id
```

If you would like to clone down this repository yourself, please do so and then follow these steps:
```
bundle
rake db:create
rake db:migrate
```

You will then be able to manipulate the database through rails console or through the endpoints via localhost:3000.

If you would like to run the test suite, please run `rspec` or `bundle exec rspec`.
