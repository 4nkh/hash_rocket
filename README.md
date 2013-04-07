# HashRocket

It's a simple gem to replace the hash rockets -> 

    :symbolize_key => 'value'

by the other ruby symbolize keys convention ->

    symbolize_key: 'value'

Supported formats: ( rb, erb, html, haml, spec, rake, yml ) + Gemfile
  
## Installation

Add this line to your application's Gemfile:

    gem 'hash_rocket'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hash_rocket

## Usage

Replace hash_rocket in every rails app files
  
    rake hash_rocket:convert

Specify directory:

    rake hash_rocket:convert FOLDER="/!!COMPLETE!!/path/to/directory"

Specify a single file path:
    
    rake hash_rocket:convert TARGET="/!!COMPLETE!!/path/to/file"

Specify verbose mode (print all the matching string):

    rake hash_rocket:convert VERBOSE="true"

You can pass more than one option as well

Notes:

    This script will prompt you the files he cannot parse
    --> ERROR ON /path/to/the/problematic/file

