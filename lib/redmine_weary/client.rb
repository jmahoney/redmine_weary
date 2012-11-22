require "weary/client"

module RedmineWeary
  class Client < Weary::Client
    
    FORMAT = "json"
    
    domain RedmineWeary.configuration.endpoint

    def initialize
      @defaults = {}
      @defaults[:key] = RedmineWeary.configuration.api_key   
    end
    
    autoload :Issues, "redmine_weary/client/issues"
  end
end