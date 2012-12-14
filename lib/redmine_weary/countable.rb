module RedmineWeary
  module Countable

    module ClassMethods
      
      #the method of getting a total count seems to
      #be the same for every Redmine API call
      def count(options = {})      
        response = list(options.merge(:limit => 1, :offset =>0)).perform
        response.parse['total_count'].to_i  
      end
    end
    
    def self.included(base)
      base.extend(ClassMethods)
    end
    
  end
end