require 'spec_helper'

describe RedmineWeary::Client::Projects do
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
    it "generates a request to get a specific project" do
      project = @client.show(:project_id => 132)
      project.uri.to_s.should match "/projects/132.json"
      project.uri.query.to_s.should match "key=MYAPIKEY"
    end
    
    it "generates a request for a project with extra information" do
      project = @client.show(:project_id => 132, :include => "trackers")
      project.uri.query.to_s.should match "include=trackers"
    end
    
    it "raises an error when no issue id is given" do
      expect { @client.show }.to raise_error Weary::Resource::UnmetRequirementsError
    end
  end
  
  describe "#list" do
    it "generates a request for a list of projects" do
      projects = @client.list
      projects.uri.to_s.should match "/projects.json"
      projects.uri.query.to_s.should match "key=MYAPIKEY"      
    end
    
    it "generates a request for a list of projects with a limit and offset" do
      projects = @client.list(:limit => 1, :offset => 0)
      projects.uri.query.to_s.should match "limit=1"
      projects.uri.query.to_s.should match "offset=0"
    end
  end
  
end