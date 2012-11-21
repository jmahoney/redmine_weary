require "redmine_weary/configuration"
require "redmine_weary/client"

module RedmineWeary
  class Client
    class Issues < RedmineWeary::Client
      
      get :issue, "/issues/:issue_id.#{FORMAT}" do |resource|
        resource.required :key
      end
      
      get :issues, "/issues.#{FORMAT}" do |resource|
        resource.required :key
        resource.optional :tracker_id, :status_id, :project_id, :offset, :limit, 
                          :sort, :assigned_to_id, :created_on
      end

    end
  end
end