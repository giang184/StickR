
# StickR by Andrew Giang, Dave
This project creates an application that would allow users to create an account and upload photos to their account. Normal users would have access to upload, edit, and delete photos. Admin users can view and delete users and their photos from the database.

## Technology Used
* _Ruby_
* _rails_
* _Docker_
* _Ruby Gems: rspec, pry, faker, bootstrap, capybara, shoulda-matchers, simplecov_
* _Postgres_
* _Active Recorder_

## Set up and Installation
* This project runs on Ruby or Docker. You need to have either application installed on your local machine.
* Download or Clone this directory into your local drive.
* In your terminal, go to the project's root directory and run `compose up --build`
* If you nagivate to `http://localhost:3000/` without setting up a database, though, you'll get a `PG::ConnectionBad` error.
* You will need to create the database and seed the database in order for the live server to render. To create a database on your local machine, you will need to run `rake db:create` and run migrations to create this project's tables by running `rake db:migrate` and `rake db:test:prepare`
* Once the database is set up, you can navigate to `http://localhost:3000/` to see the landing page
* If you want to seed the database with fake data, you can run `rake db:seed`
* To run tests, you need to bundle install rspec by running `bundle exec rails generate rspec:install`. Then replace `spec` directories with your own tests (for `spec`). Then run the command `rspec` in terminal
* When you're done running the server, you should always type in `docker-compose down` to gracefully stop the container.

## Known Bugs

* none

## License

[MIT](https://en.wikipedia.org/wiki/MIT_License)

## Contact Information

Andrew Giang | giang184@gmail.com
Dave Lindqvist | Lindqvist.Dave@gmail.com
Arthur Lee | meleearthur@gmail.com

