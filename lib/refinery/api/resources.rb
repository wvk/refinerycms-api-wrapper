require "refinery/api/helpers/client_helper"

module Refinery
  module API
    class Resources
      include Refinery::API::Helpers::ClientHelper

      def index
        config.connection.get(resources_path)
      end

      def show(id:)
        config.connection.get(resources_path(id))
      end

      def create(resource:)
        config.connection.post(resources_path) do |req|
          req.body = resource.to_json
        end
      end

      def update(id:, resource:)
        config.connection.put(resources_path(id)) do |req|
          req.body = resource.to_json
        end
      end

      def destroy(id:)
        config.connection.destroy(resources_path(id))
      end

      private
        def resources_path(id = nil)
          path = api_path + "/resources"
          path << "/#{id}" if id
          path
        end
    end
  end
end