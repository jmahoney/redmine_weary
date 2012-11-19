require "redmine_weary/client"

module RedmineWeary
  class Client
    class Issues < RedmineWeary::Client
      
      get :view, "/issues/:issue_id.#{FORMAT}"

    end
  end
end