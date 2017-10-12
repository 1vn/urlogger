# Urlogger
Logs url visit based on absolute match or regex matching. Comes included with page that breaks down # of visits per day at each route.

## Usage
Instantiate a `Urlogger::VisitCounter` in the desired controller and pass the desired path (i.e. `request.fullpath`) into the `log_url` method as a `before_action`
Example for logging every url visit in your application:
```
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :log_visit

  private

  def log_visit
    @visit_logger = Urlogger::VisitCounter.new
    @visit_logger.log_url request.fullpath
  end
end

```

By default, it will log the exact URL paths given. You can also configure an initializer to only match certain URLs by regex. Simply add an `initializer/urlogger.rb` file set `Urlogger.regex_match` within it to the regex object you wish to check the url against.

A simple HTML page which breaks down regex/url matches by day is available via mounting the engine in your application's `routes.rb` file:
```
  mount Urlogger::Engine => '/urlogger'
```
You can then visit the breakdown page at `/urlogger/visits`
## Installation
Add this line to your application's Gemfile:

```ruby
gem 'urlogger'
```

And then execute:
```bash
$ bundle
$ bin/rails urlogger:install:migrations
$ bin/rails db:migrate
```

Or install it yourself as:
```bash
$ gem install urlogger
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
