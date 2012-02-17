module SlimAssets
  class Engine < ::Rails::Engine
    initializer "sprockets.slim", :after => "sprockets.environment", :group => :all do |app|
      next unless app.assets

      app.assets.register_engine('.slim', SlimSprocketsEngine)
    end
  end
end

module SlimAssets
  class Railtie < ::Rails::Railtie
    if ::Rails.version.to_f >= 3.1
      config.app_generators.javascript_template_engine :slim
    end
  end
end
