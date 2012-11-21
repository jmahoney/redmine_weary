module RedmineWeary
  class Configuration
    attr_accessor :redmine_host, :api_key

    def initialize
      @redmine_host = ""
      @api_key = ""
    end

  end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield configuration
  end
end
