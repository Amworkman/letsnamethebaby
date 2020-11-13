# README

This is a simple app to help the user and their partner pick a name for their baby.

It works by having each parent add their favorite names to their list, then comparing each list and finding the common names.

To get started Check out the repository
git clone git@github.com:Amworkman/letsnamethebaby.git
Then you will want to run bundle install.

If you want to have a database full of names, you will need to download and import a csv, or spend some time creating your own list... Alternatively you could have the users fill your database for you as they create and add names to their list.

run rake:db:migrate then bundle exec rails s
And now you can visit the site with the URL http://localhost:3000