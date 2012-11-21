require 'spec_helper'

describe RedmineWeary::Client::Issues do
  before do
    @host = "http://example.com"
    @api_key = "MYAPIKEY"
    
    @client = described_class.new(@host, @api_key)
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
  
  describe "#issue" do
    it "generates a request to get a specific issue" do
      issue = @client.issue(:issue_id => "1234")
      issue.uri.to_s.should match "/issues/1234.json"
    end
    
    it "raises an error when no issue id is given" do
      expect { @client.issue }.to raise_error Weary::Resource::UnmetRequirementsError
    end
  end
  
  describe "#issues" do
    it "generates a request to get a list of issues" do
      issues = @client.issues
      issues.uri.to_s.should match "/issues.json"
      issues.uri.query.to_s.should match "key=MYAPIKEY"
    end
    
    it "generates requests with optional filters" do
      issues = @client.issues(:tracker_id => 2, :status_id => 1, :project_id => 1, 
                              :offset => 0, :limit => 100, :sort => "ASC",
                              :assigned_to_id => 232, :created_on => "2012-03-12")
      issues.uri.to_s.should match "/issues.json"
      issues.uri.query.to_s.should match "tracker_id=2"
      issues.uri.query.to_s.should match "status_id=1"
      issues.uri.query.to_s.should match "project_id=1"
      issues.uri.query.to_s.should match "offset=0"
      issues.uri.query.to_s.should match "limit=100"
      issues.uri.query.to_s.should match "sort=ASC"
      issues.uri.query.to_s.should match "assigned_to_id=232"
      issues.uri.query.to_s.should match "created_on=2012-03-12"
    end
    
    it "does not generate a request with unspecified filters" do
      issues = @client.issues(:project_id => 1)
      issues.uri.query.to_s.should_not match "tracker_id=2"
    end
    
  end
end