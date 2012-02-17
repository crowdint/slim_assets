require "slim_assets/version"

if defined? Rails
  if Rails.version.to_f >= 3.1
    require "slim_assets/engine"
  end
end

module SlimAssets
  autoload :SlimSprocketsEngine, "slim_assets/slim_sprockets_engine"
end
