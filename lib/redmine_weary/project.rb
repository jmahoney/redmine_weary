module RedmineWeary
  class Project
    def self.client
      RedmineWeary::Client::Projects.new
    end
  end
end