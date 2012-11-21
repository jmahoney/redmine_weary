require "weary/client"

module RedmineWeary
  class Client < Weary::Client
    FORMAT = "json"
      

    def initialize(host, api_key)
      self.class.domain(host)
      @defaults = {}
      @defaults[:key] = api_key   
    end

    autoload :Issues, "redmine_weary/client/issues"
  end
end