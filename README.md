# Library Management System

Library Management System is a web application built with Ruby on Rails that allows users to browse and borrow books from a library.

Ruby version 2.7.6 and Rails version 7.0.8.1

## Features

- View books available in the library.
- Borrow books from the library.
- Return borrowed books to the library.
- Restrict users from borrowing more books than the borrowing limit.
- Ensure users can only borrow one copy of a book at a time.
- Display borrowing history for each user.

## Setup

1. Clone the repository:


   
2. Navigate to the project directory:

    cd library_management


3. Install dependencies:


    bundle install


4. Set up the database:

    rails db:create
    rails db:migrate

5. Start the Rails server:

  rails server
  Open your web browser and visit http://localhost:3000 to view the application.

Usage
  Navigate to the homepage to view the list of available books.
  Click on a book to view details and borrow it if available.

Testing
  This project includes RSpec tests for models and controllers.

To run the tests, use the following command:


  bundle exec rspec
