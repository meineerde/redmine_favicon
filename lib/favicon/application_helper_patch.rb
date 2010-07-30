require_dependency 'favicon_helper'
require_dependency 'application_helper'

module Favicon
  module ApplicationHelperPatch
    def self.included(base) # :nodoc:
      base.send(:include, InstanceMethods)
      
      base.class_eval do
        alias_method_chain :favicon, :choice
      end
    end
    
    module InstanceMethods
      def favicon_with_choice
        link_to_favicon
      end
    end
  end
end

if ApplicationHelper.instance_methods.include?("favicon")
  ApplicationHelper.send(:include, FaviconHelper)
  ApplicationHelper.send(:include, Favicon::ApplicationHelperPatch)
end