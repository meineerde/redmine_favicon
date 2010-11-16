require_dependency 'favicon_helper'
require_dependency 'application_controller'

module Checkout
  module ApplicationControllerPatch
    def self.included(base) # :nodoc:
      base.class_eval do
        unloadable
        
        helper :favicon
      end
    end
  end
end

ApplicationController.send(:include, Checkout::ApplicationControllerPatch)
