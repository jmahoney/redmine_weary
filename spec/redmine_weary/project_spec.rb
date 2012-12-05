require 'spec_helper'

describe RedmineWeary::Project do
  before do 
    stub_request(:any, /example\.com\/projects.json/).to_return fixture('projects.json')
    stub_request(:any, /example\.com\/projects\/[0-9]+.json/).to_return fixture('project.json')
    stub_request(:any, /example\.com\/projects\/[A-Za-z0-9_\-]+.json/).to_return fixture('project.json')
  end
  
  describe "::client" do
    it "creates a new instance of the Projects client" do
      described_class.client.should be_kind_of RedmineWeary::Client::Projects
    end
  end
  
  describe "::list" do
    it "generates a request for a list of projects" do
      projects = described_class.list
      projects.should be_kind_of Weary::Request
    end
  end
  
  describe "::search" do
    it "creates an array of Project instances from the request response" do
      described_class.search.should be_instance_of Array
      described_class.search[0].should be_instance_of described_class
    end
  end
  
  describe "::count" do
    it "gets a count of the issues from the request response" do
      described_class.count.should == 1
    end
  end
  
  describe "::show" do
    it "generates a request for the details of a issue using a numeric id" do
      issue = described_class.show(132)
      issue.should be_kind_of Weary::Request
    end
    
    it "generates a request for the details of a issue an identifier string" do
      issue = described_class.show('api-testing')
      issue.should be_kind_of Weary::Request
    end
    
  end
  
  describe "::create" do
    it "creates an instance of Project from the request response" do
      described_class.create('api-testing').should be_instance_of described_class
    end
  end
  
  describe "instance methods" do
    before do
      @project = described_class.create('api-testing')
    end
    
    describe "#id" do
      
      it "returns the id of the project" do
        @project.id.should == 132
      end
      
      it "returns the project's identifier string" do
        @project.identifier.should == "apitesting"
      end
      
      it "returns the project's name" do
        @project.name.should == "API Testing"
      end
      
      it "returns the project's description" do
        @project.description.should == "Test project for API"
      end
      
    end  
  end
  
  
end