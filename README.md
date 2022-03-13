# README

# Air Quality Alert
* An app where a user can enter a city and air quality threshold. It lets them know the current air quality index and if it is above their set threshold.
* Live app is here https://radiant-temple-05462.herokuapp.com/
* Thanks for taking time to look at this! I appreciate any feedback!

# Setup

* Ruby version 2.7.2
* Rails version 7.02

* run a `bundle install` to get necessary depdencies
* `rake db:migrate && rake db:setup` to get the db setup
* `rspec spec` to run the tests


# Improvements

* Form error handling. I ran into a but with turbo-rails and devise, but ran out of time to fix it.
* More feature testing.  Would have been nice to write some end to end tests using capybara for a bit more coverage. I didn't test a lot of controller logic like user creation and editing since a lot of that resource creation is handled be devise.
* Would have added VCR to better stub out the API service. I handled it with a dummy fixture and a using an rspec stub.
* I think in regards to a product improvement text messaging alerts would vastly improve this MVP. The architecture I have in mind for that is a combination of a cron jobto get air quality for our users a certain frequency. I would use that cron job, fire off background jobs.  We can handle the background jobs with something like Resque. Then just texting users if it is over their air quality threshold they specified.
* Presenters would be nice for some of the conditional logic I jammed into the view

# Learning lessons
* Probably no devise next time as I ran into some issues with customization. I learned a lot about devise though so happy about that.

