require 'hash_rocket'
require 'rails'
class Railtie < Rails::Railtie
  rake_tasks do
    require 'lib/hash_rocket/tasks.rb'
  end
end
