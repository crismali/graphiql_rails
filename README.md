GraphiqlRails
===========
[![Gem Version](https://badge.fury.io/rb/graphiql_rails.svg)](http://badge.fury.io/rb/graphiql_rails)
[![Build Status](https://travis-ci.org/crismali/graphiql_rails.svg?branch=master)](https://travis-ci.org/crismali/graphiql_rails)

Integrates [Graphiql](https://github.com/graphql/graphiql) with [Rails](https://github.com/rails/rails).

Installation and Usage
----------------------

Add this line to your application's Gemfile:

```ruby
gem "graphiql_rails"
```

And then execute:

    $ bundle install

Then in your `routes.rb`:

```ruby
mount GraphiqlRails::Engine => "/graphiql_rails", defaults: { endpoint: "/path_to_graphql_endpoint" }
```

Then you can visit `/graphiql_rails` (or wherever you mounted the engine at) enjoy the full power of Graphiql.

Contributing
------------

1. [Fork it](https://github.com/crismali/graphiql_rails/fork)
2. Clone it locally
3. `cd` into the project root
4. `bundle install`
5. `appraisal install`
6. Run the specs with `appraisal rake`
7. Create your feature branch (`git checkout -b my-new-feature`)
8. Commit your changes (`git commit -am 'Add some feature'`)
9. Push to the branch (`git push origin my-new-feature`)
10. Create a new Pull Request
