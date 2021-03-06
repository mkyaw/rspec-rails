module RSpec
  module Rails
    # Container class for request spec functionality.
    module RequestExampleGroup
      extend ActiveSupport::Concern
      include RSpec::Rails::RailsExampleGroup
      include ActionDispatch::Integration::Runner
      include ActionDispatch::Assertions
      include RSpec::Rails::Matchers::RedirectTo
      include RSpec::Rails::Matchers::RenderTemplate
      include ActionController::TemplateAssertions

      # Delegates to `Rails.application`.
      def app
        ::Rails.application
      end

      included do
        before do
          @routes = ::Rails.application.routes
        end
      end
    end
  end
end
