module RedmineWeary
  class Configuration
    attr_accessor :endpoint, :api_key

    def initialize
      @endpoint = ""
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
