module RedmineWeary
  class Client
    class Projects < RedmineWeary::Client
      
      domain RedmineWeary.configuration.endpoint
      
      get :show, "/projects/:project_id.#{FORMAT}" do |resource|
        resource.required :key   
        resource.optional :include   
      end
      
      get :list, "/projects.#{FORMAT}" do |resource|
        resource.required :key
      end
      
      
      
    end
  end
end