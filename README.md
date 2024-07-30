# AuctionPlatform

## Setup
I used postgres through docker. As such you need to create a `config/local_env.yml` file which will contain the following
```
USERNAME: 'your postgres user'
PASSWORD: 'your postgres password'
```
This will ensure that you're authenticated within your database. 

You should run `bin/rails db:seed` to initialise the database with seed data. Most of this code has been defined in the `db/seeds.rb` file.

All the seeded users have the same password `foobar123` and the first and second default user have the email `email@example.com` and `email2@example.com`

Some UI templates used were obtained from free tailwindcss templates to speed up the development process.

## Running the project
Ensure you create the database, run the migrations and seed the database. You can run `bin/rails db:create db:migrate db:seed`

Ensure all the tests are passing on the repo you pull by running `rspec spec`

I use Foreman in the project and you can start the server by running `foreman start -f Procfile.dev`

## Notes
Websockets may take some time to connect, as such the first try the updates to the bids on other sessions may not update. However, once the server connects, updates are realtime.

The countdown timer was not implemented due to time. 

### Further improvements 
**Pagination** to prevent loading all items at a go. This reduces the number of concurrent websocket connections. If we have only 10 auction items this is not as big a problem as compared to if we had 1000s. 