require 'rubygems'
require 'bundler/setup'

require 'hash_rocket' # and any other gems you need
Dir[File.expand_path('../..',__FILE__) + "spec/data/*"].each {|f| require f}

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
end
