require 'redmine_weary'
#RedmineWeary::Client and subclasses rely on config variables to be set
#when they are loaded/required by ruby
RedmineWeary.configure do |config|
  config.redmine_host = 'http://example.com'
  config.api_key = 'MYAPIKEY'
end
require 'redmine_weary/client'

require 'webmock/rspec'
WebMock.disable_net_connect!

def fixture_path
   File.expand_path("../fixtures", __FILE__)
end

def fixture(filename)
  File.new("#{fixture_path}/#{filename}")
end