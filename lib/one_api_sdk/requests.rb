# frozen_string_literal: true

require 'rails/all'
require 'net/http'
require 'uri'
require 'json'
require 'dotenv/load'

module OneApiSdk
  module Requests
    BASE_URL="https://the-one-api.dev/v2/"

    def get(path)
      uri = URI(BASE_URL + (path || ''))

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(uri)
      request['Authorization'] = "Bearer " + (ENV['THE_ONE_API_KEY'] || Rails.application&.credentials&.the_one_api_key)

      JSON.parse(http.request(request).body)
    end
  end
end
