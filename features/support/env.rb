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
  ENV['GACLI_TEST'] = '1'
end
After do
  ENV['HOME'] = @real_home
  ENV['GACLI_TEST'] = nil
end

require 'ga/cli'

