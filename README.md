# JsonFields

This gem adds a simple UI to your form when you're dealing with [Postgres JSON](https://www.postgresql.org/docs/9.6/static/datatype-json.html). 

Works with Rails 5.0+ (It probably works on 4.2 series as well, I just haven't tried it yet)


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'json_fields'
```

And then execute:

    $ bundle


## Usage

First setup the models that use the json fields. In your model, you'll use the `json_field` method which takes 2 arguments. 
The first is the name of the attribute, and the second is a configuration string. 

**NOTE:** There's only 2 supported options for the configuration string currently. `Array(Simple)` and `Hash(Simple)`. See [Configurations](#configurations) for more details.

In your model:
```ruby
class User < ApplicationRecord
  json_field :settings, "Hash(Simple)"
end
```

Next, in your form you'll use the `json_field`.

In your view:
```
= form_for(@user) do |f|
  = f.label(:settings)
  = f.json_field(:settings, class: 'form-control')
  = f.submit('Save', class: 'btn')
```

In your controller:
```ruby
def user_params
  params.require(:user).permit(settings: [])
end
```

## Configurations

The model's attribute configurations are used to determine how the fields should be setup. This format may change from `Array(Simple)` to maybe something like `Array(String)` to determine the type of fields. I'm still thinking on that one. For now, we will support a simple array and a simple hash.

Consider these two json structures:

```json
// Simple Hash
{ "theme": "dark", "wants_spam_emails": false, "version": 1 }

// Simple Array
[ "ruby", "python", "crystal", "elixir" ]
```

If you're storing your data as one of these two formats, then you'll use `Hash(Simple)` or `Array(Simple)`. More complex structures will be supported later. 


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jwoertink/json_fields. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the JsonFields project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jwoertink/json_fields/blob/master/CODE_OF_CONDUCT.md).
