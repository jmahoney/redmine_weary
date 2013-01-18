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
    
    def self.show(user_id)
      client.show(:user_id => user_id)
    end
    
    def self.create(user_id)
      response = show(user_id).perform
      self.new(response.parse)
    end
    
    def initialize(user_body)
      @user = user_body['user']
    end
    
  end
end