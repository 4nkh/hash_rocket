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


## Stats

    $ rake hash_rocket:convert VERBOSE=true
    ...
    It took 6.5375 seconds to complete the process

    $ rake stats
    +----------------------+-------+-------+---------+---------+-----+-------+
    | Name                 | Lines |   LOC | Classes | Methods | M/C | LOC/M |
    +----------------------+-------+-------+---------+---------+-----+-------+
    | Controllers          | 47834 | 34550 |     141 |    2174 |  15 |    13 |
    | Helpers              |  4044 |  3119 |       1 |     321 | 321 |     7 |
    | Models               | 25677 | 18657 |     309 |    1712 |   5 |     8 |
    | Libraries            |  2809 |  1961 |      76 |     151 |   1 |    10 |
    | Model specs          |   190 |   160 |       0 |       0 |   0 |     0 |
    +----------------------+-------+-------+---------+---------+-----+-------+
    | Total                | 80554 | 58447 |     527 |    4358 |   8 |    11 |
    +----------------------+-------+-------+---------+---------+-----+-------+
      Code LOC: 58287     Test LOC: 160     Code to Test Ratio: 1:0.0
      
    
