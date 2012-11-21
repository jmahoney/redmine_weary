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
  
  describe "::defer" do
    it "asynchronously defers the issues instantiation" do
      request = described_class.show(10328)
      described_class.defer(request.perform).class.should be described_class
    end
  end
  
  describe "::client" do
    it "creates a new instance of the Issues client" do
      described_class.client.should be_kind_of RedmineWeary::Client::Issues
    end
  end
  
  describe "::show" do
    it "generates a request for the details of a issue" do
      detail = described_class.show(10328)
      detail.should be_kind_of Weary::Request
    end
  end
  
  # describe "::create" do
  #   it "creates an instance of Issue from the request response" do
  #     described_class.create(10328).should be_instance_of described_class
  #   end
  # end
end