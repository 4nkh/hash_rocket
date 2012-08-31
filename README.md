# HashRocket

It's a simple gem to replace the old hash rocket 

:symbolize_key => 'value'

between symbolize keys and their values by the new way:

symbolize_key: 'value'

## Installation

Add this line to your application's Gemfile:

    gem 'hash_rocket'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hash_rocket

## Usage

Run your console

    $ bundle exec rails c

Replace old hash_rocket
  
    HashRocket.convert

Notes:

    This script will prompt you the files he cannot parse
    --> ERROR ON /path/to/the/problematic/file
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
