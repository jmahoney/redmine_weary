module RedmineWeary
  
  class Issue
    
    def self.client
      RedmineWeary::Client::Issues.new
    end
    
    def self.defer(future)
      require 'weary/deferred'
      Weary::Deferred.new future, self, lambda {|issue, response| issue.new(response.parse) }
    end
    
    def self.show(issue_id)
      client.show(:issue_id => issue_id)
    end
    
    def self.create(issue_id)
      response = issue(issue_id).perform
      self.new response.parse
    end
    
    def initialize(issue_body)
      @issue = issue_body
    end
    
  end
  
end