Synchro
========================

Rails Version : 3.2.7

Ruby Version : 1.9.3

Host : Heroku

Setup and Installation
======================

Install gems for Ruby.

    gem install bundler --pre
    bundle install

Running Application
===================

To start, open terminal and enter:

    rails s

You can now navigate to the server at http://localhost:3000/.  To create a login, in terminal:

    rails c
    u = User.new
    u.username = "<your email here>"
    u.password = "<your password here>"
    u.save!
    exit

You should now have an account.  Note: At save, the entered password has been hashed and cannot be reverse engineered.  There is currently no way to reset your password except for recreating your account.

Deploying
=========

    git remote add heroku git@heroku.com:synchro-archess.git
    git push heroku master

## Credits

* Heroku for providing Hosting
* New Relic for providing debug logging 