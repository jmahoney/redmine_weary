module RedmineWeary
  
  class Issue
    
    def self.client
      RedmineWeary::Client::Issues.new(RedmineWeary.configuration.redmine_host, 
                                   RedmineWeary.configuration.api_key)
    end
    
  end
  
end