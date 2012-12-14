module RedmineWeary
  autoload :Issue, 'redmine_weary/issue'
  autoload :Project, 'redmine_weary/project'
end

require 'redmine_weary/configuration'
require 'redmine_weary/version'
require 'redmine_weary/countable'