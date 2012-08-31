namespace "hash_rocket" do
  desc "find and replace old hash_rockets"
  task convert: :environment do 
    HasHRocket.convert
  end
end
