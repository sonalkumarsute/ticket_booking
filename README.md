# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby Version: 2.6.3

* Rails Version: 5.1.7

# ticket_booking

Demo App Available at: 

https://booking-lycan.herokuapp.com/


To get JSON data for venues

https://booking-lycan.herokuapp.com/get_layout?venue=venue_id

E.g:

https://booking-lycan.herokuapp.com/get_layout?venue=1

Ticket Booking App:

App will help you find best seat in theater, for single person or group of members.

App has multiple movies running currently and venues available, help yourself and you can add more venues and movies to app.

You can edit, delete movies and add new ones.You can get IMDB links for each movie.

There are 3 tabs on navbar

Movies: You can access all movies by clicking on this or homepage itself will show all the movies.

Venues: You can access all venues by clicking on this, edit and delete option are there.

Add Movie: By clicking on this tab, you can add new movie

Add Venue: By clicking on this tab, you can add new venue.

Add shows: You can add which movie will play at which venue. 

NOTE: To find best seat please check movie page, there you by clicking "Book" option you can find best seat available.




Setup on Your Machine:

1. Install Ruby version > 2, I have used 2.6.3
2. Take clone of the github app link
3. Run: bundle install in clone directory
4. Run rake db:create
5. Run rake db:migrate
6. Run the app, rails s


