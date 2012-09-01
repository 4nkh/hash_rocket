require "hash_rocket"

module HashRocket 
  if defined? Rails::Railtie
    require "rails"
    class Railtie < Rails::Railtie
      rake_tasks do
        load "tasks/hash_rocket.rake"
      end
    end
  end
end
