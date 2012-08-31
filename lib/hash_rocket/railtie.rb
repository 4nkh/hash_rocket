require 'hash_rocket'
require 'rails'
module HashRocket
  class Railtie < Rails::Railtie
    rake_tasks do
      require 'lib/hash_rocket/tasks.rb'
    end
  end
end
