namespace "hash_rocket" do
  desc "find and replace old hash_rockets"
  task convert: :environment do |t, arg|
    puts t.inspect
    puts arg.inspect 
    HashRocket.convert(arg[:response])
  end
end
