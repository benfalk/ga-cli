$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')
$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../')
require 'aruba/cucumber'
require 'fileutils'

# Sandbox tests home directory
Before do
  @real_home = ENV['HOME']
  fake_home = File.join '/tmp','fake_home'
  FileUtils.rm_rf fake_home, secure: true
  ENV['HOME'] = fake_home
  FileUtils.mkdir ENV['HOME']
end
After do
  ENV['HOME'] = @real_home
end

require 'ga/cli'
