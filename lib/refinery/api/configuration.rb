require "faraday"
require "faraday_middleware"

module Refinery
  module API
    class Configuration
      attr_accessor :api_token, :api_url, :api_path, :locale

      def initialize
        @api_token = ""
        @api_url = ""
        @locale = nil
        @api_path = "/api"
      end

      def connection
        @_connection ||= ::Faraday.new(url: api_url,
          headers: { "X-Refinery-Token" => api_token }) do |faraday|
            faraday.request :multipart
            faraday.request :json
            faraday.request :url_encoded
            faraday.adapter Faraday.default_adapter
        end
      end
    end
  end
end
