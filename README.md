CruxEmailToFriend
=================

CruxEmailToFriend is an extension for Spree Commerce. It is mandatory that Spree has to be installed in the system
to add this extension. CruxEmailToFriend enables users to send product reference urls to your friend via email


Installation
===========
It is mandatory that Spree has to be installed prior to the inclusion of the Extension.

Start by adding the gem to your existing Rails 3.x application's Gemfile

gem 'crux_email_to_friend',:git=>'git@github.com:railsfactory/crux_email_to_friend.git'

gem 'recaptcha',:git=>'https://github.com/ambethia/recaptcha.git'

Now bundle up with:

bundle install

Next, run the rake task that copies the necessary migrations and assets to your project:

rake spree_core:install

rake spree_auth:install

rake crux:install

rake crux_email_to_friend:install

Now you should be able to boot up your server with:

rails s  

Usage
=================

Login to your store adminstration console

Config your mail settings

Config your recaptcha settings

Click Email a friend link in individual product page



