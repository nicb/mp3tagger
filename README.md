# Mp3tagger - a simple software that tags any mp3 file with information deduced from a properly formatted file name

[![Build Status](https://travis-ci.org/nicb/mp3tagger.svg?branch=master)](https://travis-ci.org/nicb/mp3tagger)

`mp3tagger` is a simple software that tags any mp3 file with information deduced from a properly formatted file name.

A "*properly formatted file name*" is a filename which is formatted as such:

```
<track number> - <album> - <artist> - <title> - <year> - <subtitle>.mp3
```

Such a formatting can be obtained, for example, when ripping a CD with `pacpl`
and the following options

```sh
$ pacpl --rip all --nscheme="%tr - %ab - %ar - %ti - %yr" [... other options]
```

(this doesn't produce a `subtitle` tag, but it can be added by hand later on).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mp3tagger'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install mp3tagger

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nicb/mp3tagger.

## License

`mp3tagger` is (c) Nicola Bernardini 2020 and it is licensed along the [GNU GPL 3.0 license](./LICENSE).
