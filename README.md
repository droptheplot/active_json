# ActiveJson

[![Gem Version](https://badge.fury.io/rb/active_json.svg)](https://badge.fury.io/rb/active_json)
[![Code Climate](https://codeclimate.com/github/droptheplot/active_json/badges/gpa.svg)](https://codeclimate.com/github/droptheplot/active_json)

Easy JSON storage.

## tl;dr

Access JSON like `{ "something": "otherthing" }` by `MyDatabase.something`.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_json'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install active_json
```

## Getting Started

* Create your `my_database.json` somewhere.
* Define database module with `ActiveJson::Base`.

```ruby
module MyDatabase
  extend ActiveJson::Base

  configure do |config|
    config.path = 'path/to/my_database.json'
  end
end
```

## Usage

### JSON

You can access your json as any ruby `Object` or `Array`. For example, if your database looks like this:

```json
{
  "website": "Mr. Buster Muller's Blog.",
  "posts": [
    {
      "id": 1,
      "title": "Sustainable twee kinfolk cronut williamsburg franzen.",
      "published": true
    },
    {
      "id": 2,
      "title": "Marfa skateboard synth swag.",
      "published": false
    }
  ]
}
```

Then you can do something like this:

```ruby
# Get website title
MyDatabase.website

# Iterate through posts
MyDatabase.posts each do |post|
  puts post.title
end
```

### Update

Update you database as you want:

```ruby
MyDatabase.website
# => "Mr. Buster Muller's Blog."

MyDatabase.website = "Someone else's Blog."

MyDatabase.website
# => "Someone else's Blog."
```

### Reload

If you changed something and don't want it anymore:

```ruby
MyDatabase.website
# => "Mr. Buster Muller's Blog."

MyDatabase.website = "Someone else's Blog."

MyDatabase.website
# => "Someone else's Blog."

MyDatabase.reload

MyDatabase.website
# => "Mr. Buster Muller's Blog."
```

### Save

Or save you changes into `my_database.json` file:

```ruby
MyDatabase.website
# => "Mr. Buster Muller's Blog."

MyDatabase.website = "Someone else's Blog."

MyDatabase.website
# => "Someone else's Blog."

MyDatabase.save
# => true

MyDatabase.reload

MyDatabase.website
# => "Someone else's Blog."
```

## Contributing

1. Fork it (https://github.com/droptheplot/active_json/fork)
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
