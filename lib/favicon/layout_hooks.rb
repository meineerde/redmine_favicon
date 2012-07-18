require File.expand_path(File.dirname(__FILE__) + '/../../app/helpers/favicon_helper')

module Favicon
  class LayoutHooks < Redmine::Hook::ViewListener
    include FaviconHelper
    
    def view_layouts_base_html_head(context = { })
      link_to_favicon
    end
  end
end
