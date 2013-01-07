require 'spec_helper'

describe RedmineWeary::User do
  before do 
    stub_request(:any, /example\.com\/users.json/).to_return fixture('users.json')
    stub_request(:any, /example\.com\/users\/[0-9]+.json/).to_return fixture('user.json')
  end
  
  describe "::client" do
    it "creates a new instance of the Users client" do
      described_class.client.should be_kind_of RedmineWeary::Client::Users
    end
  end
  
  describe "::list" do
    it "generates a request for a list of users" do
      users = described_class.list
      users.should be_kind_of Weary::Request
    end
  end
  
  describe "::search" do
    it "creates an array of User instances from the request response" do
      described_class.search.should be_instance_of Array
      described_class.search[0].should be_instance_of described_class
    end
  end
  
  describe "::count" do
    it "gets a count of the users from the request response" do
      described_class.count.should == 96
    end
  end
  
  describe "::show" do
    it "generates a request for the details of a user" do
      user = described_class.show(10328)
      user.should be_kind_of Weary::Request
    end
  end

  describe "::create" do
    it "creates an instance of User from the request response" do
      described_class.create(10328).should be_instance_of described_class
    end
  end
  
end