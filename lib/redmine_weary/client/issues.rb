module RedmineWeary
  class Client
    class Issues < RedmineWeary::Client
      
      domain RedmineWeary.configuration.endpoint
      
      get :show, "/issues/:issue_id.#{FORMAT}" do |resource|
        resource.required :key
      end
      
      get :list, "/issues.#{FORMAT}" do |resource|
        
        optional_args = [:tracker_id, :status_id, :project_id, :offset, :limit, 
                          :sort, :assigned_to_id, :created_on]
                          
        10000.times do |i| 
          optional_args << "cf_#{i}".to_sym
        end
                                    
        resource.required :key
        
        resource.optional *optional_args
                          
      end

    end
  end
end