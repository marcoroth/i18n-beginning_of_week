# I18n::BeginningOfWeek

Different places use different days of the week for the beginning of the week. Ruby allows a configuration variable to be set that
will change it but that assumes all users have the same beginning of the week requirement. This gem uses I18n to determine the beginning of the week value based on locale allowing users to have automatic different beginning of week settings.

The locale days of week are taken from [momentjs](https://github.com/moment/moment). Changes and corrections are welcome through pull requests.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'i18n-beginning_of_week'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install i18n-beginning_of_week

## Usage

### Get the beginning_of_week for a locale

```
I18n.locale = :en
I18n.beginning_of_week # => :sunday
```

OR

```
I18n.beginning_of_week(:en) # => :sunday
```

### Set the Ruby configuration variable using the I18n.locale value or passed locale value

```
I18n.locale = :fr
Date.beginning_of_week = I18n.beginning_of_week
Date.beginning_of_week # => :sunday
```

OR

```
Date.beginning_of_week = I18n.beginning_of_week(:fr)
Date.beginning_of_week # => :monday
```


### Run a block with the beginning of week value set using the I18n.locale value or passed locale value
```
I18n.locale = :ar
I18n.in_beginning_of_week do
  Date.beginning_of_week
end # => :saturday
```

OR

```
I18n.in_beginning_of_week(:ar) do
  Date.beginning_of_week
end # => :saturday
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/markedmondson/i18n-beginning_of_week.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
