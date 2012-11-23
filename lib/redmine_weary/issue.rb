module RedmineWeary
  
  class Issue
    
    def self.client
      RedmineWeary::Client::Issues.new
    end
    
    def self.defer(future)
      require 'weary/deferred'
      Weary::Deferred.new future, self, lambda {|issue, response| issue.new(response.parse) }
    end
    
    def self.list(options = {})
      response = client.list(options)
    end
    
    def self.search(options = {})
      response = list(options).perform
      issues = []
      response.parse['issues'].each do |issue|
        issues << self.new(issue)
      end
      
      issues
    end
    
    def self.count
      response = list(:limit => 0, :offset => 0).perform
      response.parse['total_count'].to_i  
    end
    
    def self.show(issue_id)
      client.show(:issue_id => issue_id)
    end
    
    def self.create(issue_id)
      response = show(issue_id).perform
      self.new(response.parse)
    end
    
    def initialize(issue_body)
      @issue = issue_body['issue']
    end
    
    def id
      @issue['id'].to_i
    end
    
    def subject
      @issue['subject']
    end
    
    def description
      @issue['description']
    end
    
    def status_id
      @issue['status']['id'].to_i
    end
    
    def status_name
      @issue['status']['name']
    end
    
    def tracker_id
      @issue['tracker']['id'].to_i
    end
    
    def tracker_name
      @issue['tracker']['name']
    end
    
    def priority_id
      @issue['priority']['id'].to_i
    end
    
    def priority_name
      @issue['priority']['name']
    end
    
    def project_id
      @issue['project']['id'].to_i
    end
    
    def project_name
      @issue['project']['name']
    end
    
    
  end
  
end