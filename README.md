# Ruby on Rails Blog

This application is a blog with user authentication built using the Ruby on Rails Framework and Bootstrap.

## Requirements

The following are requirements to be able to build and run this application:

 * Ruby 3.1.2
 * Rails 7.0.4

## Building

The following are steps for building and running this application:

#### 1. Clone the repository

Run the following commands in your terminal:

```bash
git clone git@github.com:serialexperimentscarina/rails-blog.git
cd rails-blog
```

#### 2. Install dependencies

Run the following command to install all gem dependencies:

```bash
bundle install
```

#### 3. Create and initialize databases

Run the following commands to set up the databases:

```bash
rails db:setup
rails db:migrate
```

#### 4. Run the server

Run the following command to start the server:

```bash
rails s
```

Now, just visit 'localhost:3000' to see the application in action!


