require_dependency 'application_helper'

module Favicon
  module ApplicationHelperPatch
    def self.included(base) # :nodoc:
      base.send(:include, InstanceMethods)
      
      base.class_eval do
       alias_method_chain :favicon, :no_action
      end
    end
    
    module InstanceMethods
      def favicon_with_no_action
      end
    end
  end
end

if ApplicationHelper.instance_methods.include?("favicon")
  ApplicationHelper.send(:include, Favicon::ApplicationHelperPatch)
end