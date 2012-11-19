require "weary/client"

module RedmineWeary
  class Client < Weary::Client
    FORMAT = "json"
      

    def initialize(host,key)
      self.class.domain host
      @defaults = {}
      @defaults[:key] = key   
    end

    autoload :Issues, "redmine_weary/client/issues"
  end
end