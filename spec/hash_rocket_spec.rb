require 'spec_helper'
describe HashRocket do
  let(:folder) { File.expand_path('../..',__FILE__) + "/spec/data" }
  let(:result) { "/result.txt" }
  
  pending "write it"

  describe "hash_rocket should be replaced if the file extention is supported: " do

    before :each do
      @file = folder + example.metadata[:file_ext]
      @backup = File.read(@file)
      HashRocket.convert(nil, @file)
      @conversion = File.read(@file)
    end

    after :each do
      File.open(@file, "w") {|f| f.puts @backup }
      @backup.should eq File.read(@file)
    end

    it ".rb", :file_ext => "/file.rb" do
      @conversion.should eq File.read(folder + result)      
    end

    it ".erb", :file_ext => "/file.erb" do
      @conversion.should eq File.read(folder + result)      
    end

    it ".html", :file_ext => "/file.html" do
      @conversion.should eq File.read(folder + result)      
    end

    it ".haml", :file_ext => "/file.haml" do
      @conversion.should eq File.read(folder + result)      
    end

    it ".yml", :file_ext => "/file.yml" do
      @conversion.should_not eq File.read(folder + result)      
    end

  end
end
