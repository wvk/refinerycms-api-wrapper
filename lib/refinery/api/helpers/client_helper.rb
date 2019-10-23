module Refinery
  module API
    module Helpers
      module ClientHelper
        def config
          @_config ||= Refinery::API.configuration
        end

        def api_path
          if Refinery::API.configuration.locale
            [Refinery::API.configuration.locale, Refinery::API.configuration.api_path].join '/'
          else
            Refinery::API.configuration.api_path
          end
        end
      end
    end
  end
end
