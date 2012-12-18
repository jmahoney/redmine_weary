module RedmineWeary
  class Client
    
    class Users < RedmineWeary::Client
      
      domain RedmineWeary.configuration.endpoint
      
      get :show, "/users/:user_id.#{FORMAT}" do |resource|
        resource.required :key
        resource.optional :include
      end
      
      get :list, "/users.#{FORMAT}" do |resource|
        resource.required :key
        resource.optional :limit, :offset
      end
      
    end
    
  end
  
end