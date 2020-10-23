# Camillion News API
###### A News Aplication Programming Interface to feed a home of news about Camillion! You can retrive the latest news and also post new ones!

## Build status
Build status from **Travis** (Continus Integration)
[![Build Status](https://travis-ci.org/marachimeno/camillion-api.svg?branch=master)](https://travis-ci.org/marachimeno/camillion-api)

## Code style
Currently using **[Rubocop]**(https://github.com/rubocop-hq/rubocop/blob/master/README.md) for code formatting and code analysis (linter).
In order to use it:
- run the following command to see in which files there are style offenses:
```
rubocop
```
- run the following command to autocorrect style offenses:
```
rubocop -A
```

## Tech/Framework
This API was built using:
- **[Ruby 2.6.6]**(https://www.ruby-lang.org/en/)
- **[Rails 6.0.3]**(https://rubyonrails.org/) as framework

## Usage
Using this API is very simple. Users that are logged in will have access to all the news, where they will be able to retrive them.
Moreover, if the logged in user is an administrator, it will be able to post news.

- To see the JSON file from the terminal:
  - Retriving all news
    1. run ```rails s``` or ```rails serve```
    2. in another terminal tab run ```curl -s http://localhost:3000/api/v1/news | jq```

  - Getting a specific new
    1. run ```rails s``` or ```rails serve```
    2. in another terminal tab run ```curl -s http://localhost:3000/api/v1/news/:id | jq```

  -Posting a new
    1. run ```rails s``` or ```rails serve```
    2. in another terminal tab run ```curl -i -X POST                       \
     -H 'Content-Type: application/json'                                     \
     -d '{ "new": { "title": "New title", "content": "Content of new" } }'    \
     http://localhost:3000/api/v1/news```

- To see the JSON file from your local host:
  - Retriving all news
    1. run ```rails s``` or ```rails serve```
    2. open in browser ```http://localhost:3000/api/v1/news```

  - Getting a specific new
    1. run ```rails s``` or ```rails serve```
    2. open in browser ```http://localhost:3000/api/v1/news/:id```


## Tests
Used **[rspec-rails]**(https://github.com/rspec/rspec-rails) for testing.
In order to run the test just type the following command in the terminal:
```
rspec
```
## Database
Used [postgresql](https://www.postgresql.org/) as the database for Active Record.
Commands for postgresql:
 - Creating the db ```rails db:create```
 - Migrating the db ```rails db:migrate```
 - Dropping the db ```rails db:drop```

## System dependencies
This API depens on the [jbuilder gem](https://github.com/rails/jbuilder)(using jq binary) in order to render json files.




