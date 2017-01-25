module SlimAssets
  class Engine < ::Rails::Engine
    initializer 'slim_assets.assets.register', :group => :all do |app|
      app.config.assets.configure do |sprockets_env|
        if sprockets_env.respond_to?(:register_transformer)
          sprockets_env.register_mime_type 'application/vnd.slim-template.slim+text', extensions: ['.slim']
          sprockets_env.register_transformer 'application/vnd.slim-template.slim+text', 'application/javascript', SlimSprocketsEngine
        end

        if sprockets_env.respond_to?(:register_engine)
          args = ['.slim', SlimSprocketsEngine]
          args << { silence_deprecation: true } if Sprockets::VERSION.start_with?('3')
          sprockets_env.register_engine(*args)
        end
      end
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
