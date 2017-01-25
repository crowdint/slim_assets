require 'slim'
require 'tilt'

module SlimAssets
  class SlimSprocketsEngine < Tilt::Template
    self.default_mime_type = 'application/javascript'

    module ViewContext
      attr_accessor :output_buffer

      def self.included(klass)
        klass.instance_eval do
          include Rails.application.routes.url_helpers
          include Rails.application.routes.mounted_helpers
          include ActionView::Helpers
          include SimpleForm::ActionViewExtensions::FormHelper if defined?(SimpleForm)
        end
      end

      def protect_against_forgery?
        false
      end
    end

    def prepare
      # options = @options.merge(:filename => eval_file, :line => line)
      @engine = ::Slim::Engine.new(options)
    end

    def evaluate(scope, locals, &block)
      scope = view_context(scope)

      super
    end

    def precompiled_template(locals)
      @engine.call(data.to_str)
    end

    protected

    def context_class(scope)
      @context_class ||= Class.new(scope.environment.context_class)
    end

    def view_context(scope)
      @view_context ||= scope.tap do |s|
        s.singleton_class.instance_eval { include SlimAssets::SlimSprocketsEngine::ViewContext }
      end
    end
  end
end
