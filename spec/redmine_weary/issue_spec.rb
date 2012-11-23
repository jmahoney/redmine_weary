require 'spec_helper'

describe RedmineWeary::Issue do
  before do 
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
  
  describe "::list" do
    it "generates a request for a list of issues" do
      issues = described_class.list
      issues.should be_kind_of Weary::Request
    end
  end
  
  describe "::search" do
    it "creates an array of Issue instances from the request response" do
      described_class.search.should be_instance_of Array
      described_class.search[0].should be_instance_of described_class
    end
  end
  
  describe "::count" do
    it "gets a count of the issues from the request response" do
      described_class.count.should == 2
    end
  end
  
  describe "::show" do
    it "generates a request for the details of a issue" do
      issue = described_class.show(10328)
      issue.should be_kind_of Weary::Request
    end
  end
  
  describe "::create" do
    it "creates an instance of Issue from the request response" do
      described_class.create(10328).should be_instance_of described_class
    end
  end
  
  describe "#id" do
    it "returns the id of the issue" do
      issue = described_class.create(10328)
      issue.id.should == 10328
    end
  end
  
  describe "#subject" do
    it "returns the subject of the issue" do
      issue = described_class.create(10328)
      issue.subject.should == "In progress urgent bug"
    end
  end
  
  describe "#description" do
    it "returns the description of the issue" do
      issue = described_class.create(10328)
      issue.description.should == ""
    end
  end
  
  describe "#status_id" do
    it "returns the id of the issue's status" do
      issue = described_class.create(10328)
      issue.status_id.should == 2
    end
  end
  
  describe "#status_name" do
    it "returns the id of the issue's status" do
      issue = described_class.create(10328)
      issue.status_name.should == "In Progress"
    end
  end
  
  describe "#tracker_id" do
    it "returns the id of the issue's tracker" do
      issue = described_class.create(10328)
      issue.tracker_id.should == 1
    end
  end
  
  describe "#tracker_name" do
    it "returns the id of the issue's tracker" do
      issue = described_class.create(10328)
      issue.tracker_name.should == "Bug"
    end
  end

  describe "#priority_id" do
    it "returns the id of the issue's priority" do
      issue = described_class.create(10328)
      issue.priority_id.should == 6
    end
  end
  
  describe "#priority_name" do
    it "returns the id of the issue's priority" do
      issue = described_class.create(10328)
      issue.priority_name.should == "Urgent"
    end
  end
  
  describe "#project_id" do
    it "returns the issue's project" do
      issue = described_class.create(10328)
      issue.project_id.should == 132
    end
  end
  
  describe "#project_name" do
    it "returns the name of the issue's project" do
      issue = described_class.create(10328)
      issue.project_name.should == "API Testing"
    end
  end
end