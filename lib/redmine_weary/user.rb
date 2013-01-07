module RedmineWeary
  class User
    include RedmineWeary::Countable
      
    def self.client
      RedmineWeary::Client::Users.new
    end
    
    def self.list(options = {})
      response = client.list(options)
    end
    
    def self.search(options = {})
      response = list(options).perform
      users = []
      response.parse['users'].each do |user|
        users << self.new(user)
      end
      
      users
    end
    
    
    def initialize(user_body)
      @user = user_body['user']
    end
    
  end
end