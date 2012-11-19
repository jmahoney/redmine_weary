require 'spec_helper'

describe RedmineWeary::Client::Issues do
  before do
    @host = "http://example.com"
    @key = "MYAPIKEY"
    @client = described_class.new(@host, @key)
    stub_request :any, /example\.com\/.*/
  end
  
  describe "::domain" do
    it "points to the example.com domain" do
      described_class.domain.should match "example.com"
    end
  end
  
  describe "#initialize" do
    it "inherits from Weary::Client" do
      @client.should be_kind_of Weary::Client
    end
  end
  
  describe "#view" do
     it "generates a request to get a specific issue" do
       issue = @client.view(:issue_id => "1234")
       issue.uri.to_s.should match "/issues/1234.json"
     end
    
     it "raises an error when no issue id is given" do
       expect { @client.view }.to raise_error Weary::Resource::UnmetRequirementsError
     end
   end
end