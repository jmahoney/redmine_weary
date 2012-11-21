require 'spec_helper'

describe RedmineWeary::Issue do
  before do 
    @host = "http://example.com"
    @api_key = "MYAPIKEY"
    
    RedmineWeary.configure do |config|
      config.redmine_host = @host
      config.api_key = @api_key
    end
    
    stub_request(:any, /example\.com\/issues.json/).to_return fixture('issues.json')
    stub_request(:any, /example\.com\/issues\/[0-9]+.json/).to_return fixture('issue.json')
  end
  
  describe "::client" do
    it "creates a new instance of the Issues client" do
      described_class.client.should be_kind_of RedmineWeary::Client::Issues
    end
  end
end