Given(/^there isn't a \.ga\.auth\.yaml file in the home directory$/) do
  FileUtils.rm "#{ENV['HOME']}/.ga.auth.yaml" if File.exists? "#{ENV['HOME']}/.ga.auth.yaml"
end

Then(/^the \.ga\.auth\.yaml file should exist in the home directory$/) do
  File.exists?("#{ENV['HOME']}/.ga.auth.yaml").should be(true)
end

