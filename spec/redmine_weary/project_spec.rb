require 'spec_helper'

describe RedmineWeary::Project do
  before do 
    stub_request(:any, /example\.com\/projects.json/).to_return fixture('projects.json')
    stub_request(:any, /example\.com\/project\/[0-9]+.json/).to_return fixture('project.json')
  end
  
  describe "::client" do
    it "creates a new instance of the Projects client" do
      described_class.client.should be_kind_of RedmineWeary::Client::Projects
    end
  end
end