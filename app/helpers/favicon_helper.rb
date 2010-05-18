module FaviconHelper
  include ActionView::Helpers::AssetTagHelper

  def favicon_path(type = nil)
    type ||= Setting.plugin_redmine_favicon["type"]
    case type.to_s
    when "default"
      image_path('../favicon.ico')
    when "theme"
      @current_theme ||= Redmine::Themes.theme(Setting.ui_theme)
      path = @current_theme ? "/themes/#{@current_theme.dir}/images/favicon.ico" : '../favicon.ico'
      image_path(path)
    when "url"
      Setting.plugin_redmine_favicon["url"]
    end
  end
  
  def favicon_filesystem_path(type = nil)
    type ||= Setting.plugin_redmine_favicon["type"]
    
    case type.to_s
    when "default"
      File.join(ASSETS_DIR, 'favicon.ico')
    when "theme"
      @current_theme ||= Redmine::Themes.theme(Setting.ui_theme)
      if @current_theme
        File.join(@current_theme.path, 'images', 'favicon.ico')
      else
        favicon_filesystem_path("default")
      end
    else
      # can not determine filesystem path of a random URL
      nil
    end
  end
  
  def link_to_favicon
    tag(
      "link",
      "rel" => "shortcut icon",
      "href" => URI.escape(favicon_path)
    )
  end
end