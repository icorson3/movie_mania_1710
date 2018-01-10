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

User Stories
We are going to add genres to movies (this is SEPARATE from categories). A movie can have more than one genre (example: "Action", "Adventure") and a genre can have more than one movie. Please test for this functionality.

User Story 1
As an admin user,
When I visit the genre index,
I can see a form to create new genres,
When I fill out the form with the genre's name,
And click submit,
I see a list of genres I have created.
User Story 2
As an unregistered user,
When I visit the genre index,
I cannot see the form to create new genres,
I see all genres (for testing purposes, I should see at least 2)
and each genre should be a link to that genre's specific page
User Story 3
As an unregistered user,
When I visit the movie index,
And I click on "Guardians of the Galaxy"
I see a page with "Guardians of the Galaxy",
I also see "Action", "Adventure", "Sci-Fi" under a "Genres for this Movie:" heading
I also see the rating for this movie (rating should be an attribute of a movie).
User Story 4
As an unregistered user,
When I visit the genre index,
And I click on "Action",
I see a page with the genre's name,
I see the movie "Guardians of the Galaxy" and "Suicide Squad" listed
I also see the average rating for movies in this category
