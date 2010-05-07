module FaviconHelper
  def favicon_path
    case Setting.plugin_redmine_favicon["type"]
    when "default"
      image_path("../favicon.ico")
    when "url"
      Setting.plugin_redmine_favicon["url"]
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