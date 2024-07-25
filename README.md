# AuctionPlatform

## Setup
I used postgres through docker. As such you need to create a `config/local_env.yml` file which will contain the following
```
USERNAME: 'your postgres user'
PASSWORD: 'your postgres password'
```
This will ensure that you're authenticated within your database. 

You should run `bin/rails db:seed` to initialise the database with seed data. Most of this code has been defined in the `db/seeds.rb` file.

## Running the project
Ensure you create the database, run the migrations and seed the database. You can run `bin/rails db:create db:migrate db:seed`

Ensure all the tests are passing on the repo you pull by running `rspec spec`

I use Foreman in the project and you can start the server by running `foreman start -f Procfile.dev`