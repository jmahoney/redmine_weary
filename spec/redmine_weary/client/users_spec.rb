require 'spec_helper'

describe RedmineWeary::Client::Users do
  before do    
    @client = described_class.new
    stub_request :any, /example\.com\/.*/
  end
  
  describe "::domain" do
    it "points to the domain set in the configuration" do
      described_class.domain.should match "example.com"
    end
  end
    
  describe "#initialize" do
    it "inherits from Weary::Client" do
      @client.should be_kind_of Weary::Client
    end
  end
  
  describe "#show" do  
    it "generates a request to get a specific user" do
      user = @client.show(:user_id => "1234")
      user.uri.to_s.should match "/users/1234.json"
      user.uri.host.to_s.should == 'example.com'      
    end
    
    it "generates a request for a specific user with optional parameters" do
      user = @client.show(:user_id => "1234", :include => "groups,memberships")
      user.uri.query.to_s.should match "include=groups%2Cmemberships"
    end
    
    it "raises an error when no issue id is given" do
      expect { @client.show }.to raise_error Weary::Resource::UnmetRequirementsError
    end
  end
  
  describe "#list" do
    it "generates a request to get a list of users" do
      users = @client.list
      users.uri.to_s.should match "/users.json"
      users.uri.query.to_s.should match "key=MYAPIKEY"
    end
    
    it "generates a request to get a list of users with a limit and an offset" do
      users = @client.list(:limit => 1, :offset => 2)
      users.uri.to_s.should match "/users.json"
      users.uri.query.to_s.should match "key=MYAPIKEY"
      users.uri.query.to_s.should match "limit=1"
      users.uri.query.to_s.should match "offset=2"
    end
  end
  
end