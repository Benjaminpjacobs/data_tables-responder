[![Version      ](https://img.shields.io/gem/v/data_tables-responder.svg)](https://rubygems.org/gems/data_tables-responder)
[![Build Status ](https://travis-ci.org/TwilightCoders/data_tables-responder.svg)](https://travis-ci.org/TwilightCoders/data_tables-responder)
[![Code Climate ](https://api.codeclimate.com/v1/badges/5032242cc2798697105a/maintainability)](https://codeclimate.com/github/TwilightCoders/data_tables-responder/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/5032242cc2798697105a/test_coverage)](https://codeclimate.com/github/TwilightCoders/data_tables-responder/test_coverage)

# DataTables::Responder

DataTables Responder assists with responding, filtering, searching, paginating and formatting results from DataTable client requests.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'data_tables-responder'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install data_tables-responder

## Usage

```ruby
# routes.rb

resources :users do
  post :index, constraints: { format: :dt }, on: :collection
end
```

```ruby
class UsersController < ApplicationController

  def index
    @users = User.all
    respond_to do |format|
      format.dt { render dt: @users }
    end
  end

  # ...

end
```

## Roadmap

 * Adapters for popular Search and Pagination gems

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/data_tables-responder.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

