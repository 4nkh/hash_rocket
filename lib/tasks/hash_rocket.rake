namespace "hash_rocket" do
  desc "find and replace old hash_rockets"
  task convert: :environment do 
    HashRocket.convert
  end
end
