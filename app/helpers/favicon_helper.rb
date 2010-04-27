module FaviconHelper
  def favicon_path
    case Setting.plugin_redmine_favicon["type"]
    when "default"
      image_path("../favicon.ico")
    when "url"
      Setting.plugin_redmine_favicon["url"]
    end
  end
  
  def favicon_mime_type
    case Setting.plugin_redmine_favicon["type"]
    when "default"
      "image/x-icon"
    when "url"
      mime_type = Setting.plugin_redmine_favicon["mime_type"]
      mime_type.blank? ? nil : mime_type
    end
  end    
  
  def link_to_favicon
    tag(
      "link",
      "rel" => "shortcut icon",
      "type" => favicon_mime_type,
      "href" => URI.escape(favicon_path)
    )
  end
end