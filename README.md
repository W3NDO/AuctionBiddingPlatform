# AuctionPlatform

## Setup
I used postgres through docker. As such you need to create a `config/local_env.yml` file which will contain the following
```
USERNAME: 'your postgres user'
PASSWORD: 'your postgres password'
```
This will ensure that you're authenticated within your database. 

You should run `bin/rails db:seed` to initialise the database with seed data. Most of this code has been defined in the `db/seeds.rb` file.