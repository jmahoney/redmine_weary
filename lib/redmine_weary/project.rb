module RedmineWeary
  class Project
    
    def self.client
      RedmineWeary::Client::Projects.new
    end
    
    def self.list(options = {})
      response = client.list(options)
    end
    
    def self.search
      response = list.perform
      projects = []
      response.parse['projects'].each do |project|
        projects << self.new(project)
      end
      
      projects
    end
    
    def self.count(options = {})      
      response = list(options.merge(:limit => 1, :offset =>0)).perform
      response.parse['total_count'].to_i  
    end
    
    def self.show(project_id)
      client.show(:project_id => project_id)
    end
    
    def self.create(project_id)
      response = show(project_id).perform
      self.new(response.parse)
    end
    
    
    def initialize(project_body)
      if project_body['project']
        @project = project_body['project']
      else
        @project = project_body
      end
    end
    
    def id
      @project['id'].to_i
    end
    
    def identifier
      @project['identifier']
    end
    
    def name
      @project['name']
    end
    
    def description
      @project['description']
    end
    
  end
end