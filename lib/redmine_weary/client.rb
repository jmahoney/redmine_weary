require "weary/client"

module RedmineWeary
  class Client < Weary::Client
    
    FORMAT = "json"
    DOMAIN = ENV['REDMINE_HOST']
    
    domain RedmineWeary.configuration.redmine_host

    def initialize
      @defaults = {}
      @defaults[:key] = RedmineWeary.configuration.api_key   
    end
    
    autoload :Issues, "redmine_weary/client/issues"
  end
end