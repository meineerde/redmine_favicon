require_dependency 'application_helper'
require_dependency 'favicon_helper'

module Favicon
  module ApplicationHelperPatch
    
    
    def self.included(base) # :nodoc:
      base.send(:include, InstanceMethods)
      base.send(:include, FaviconHelper)
    
      base.class_eval do
        unloadable
        alias_method_chain :favicon, :choice
      end
    end

    module InstanceMethods
      def favicon_with_choice(path)
        link_to_favicon
      end
    end
  end
end

if ApplicationHelper.instance_methods.include? "favicon"
  ApplicationHelper.send(:include, Favicon::ApplicationHelperPatch)
end