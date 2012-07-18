require 'redmine'

Rails.configuration.to_prepare do
  # Patches
  require_dependency 'favicon/themes_patch'
  require_dependency 'favicon/application_controller_patch'
  require_dependency 'favicon/application_helper_patch'
end

# Hooks
require 'favicon/layout_hooks'

Redmine::Plugin.register :redmine_favicon do
  name 'Redmine Favicon plugin'
  url 'http://dev.holgerjust.de/projects/redmine-favicon'
  author 'Holger Just'
  author_url 'http://meine-er.de'
  description 'Adds a GUI and a simple API to configure the favicon.'
  version '0.2'
  
  requires_redmine :version_or_higher => '0.8'

  settings_defaults = {
    'type' => "default",
    'url' => '',
  }
  
  settings :default => settings_defaults, :partial => 'settings/redmine_favicon'
end
