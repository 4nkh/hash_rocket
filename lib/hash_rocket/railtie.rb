require 'hash_rocket'

module HashRocket 
  if defined? Rails::Railtie
    require 'rails'
    class Railtie < Rails::Railtie
      rake_tasks do
        require 'lib/hash_rocket/tasks.rb'
      end
    end
  end
end
