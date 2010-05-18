require_dependency 'redmine/themes'

module Favicon
  module ThemePatch
    def self.included(base) # :nodoc:
      base.send(:include, InstanceMethods)
    
      base.class_eval do
        unloadable
      
        attr_reader :path
      
        # fancy alias_method_chain
        alias_method :initialize_without_path, :initialize
        alias_method :initialize, :initialize_with_path
      end
    end

    module InstanceMethods
      def initialize_with_path(path)
        initialize_without_path(path)
        @path = path
      end
    end
  end
end

Redmine::Themes::Theme.send(:include, Favicon::ThemePatch)