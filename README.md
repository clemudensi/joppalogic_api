# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# This is the api server of Joppalogic
The ruby version used is ruby 2.3.1

The root endpoint of this application is 

joppalogicapi.herokuapp.com/v1

Available endpoints formats are as specified in the stoplight of this project but the currently accessible endpoints are as follows:

* /users 
	* index
	* create
	* update

* /parcels
	*index
	*create

* /sessions this is the login endpoint where a token is generated and used in every call.
	* index

* /couriers
	* index
	* create

* /items
	* index