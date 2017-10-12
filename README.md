# Urlogger
Logs url visit based on absolute match or regex matching. Comes included with page that breaks down # of visits per day at each route.

## Usage
Instantialize a `Urlogger::VisitCounter` in the desire controller and have it log the `request.fullpath` as a `before_action`
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

By default, it will log the exact URL paths given. You can also pass configure an initializer to set only match certain URLs by regex. Simply add an `initializer/urlogger.rb` file set `Urlogger.regex_match` within it to the regex object you wish to check the url against.

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
