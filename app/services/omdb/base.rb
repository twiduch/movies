module Omdb
  class Base
    def self.call(term)
      new(term).call
    end

    def initialize(term)
      @term = term
    end

    def call
      good_response? ? desired_response : false
    end

    private

    attr_reader :term

    def desired_response
      response_object
    end

    def good_response?
      return false if imdb_response.is_a?(HTTPX::ErrorResponse)

      imdb_response.status == 200 && response_object[:Response] == 'True'
    end

    def response_object
      @response_object ||= JSON.parse(imdb_response.to_s, object_class: OpenStruct)
    end

    def imdb_response
      @imdb_response ||= HTTPX.get("#{url_base}?#{request_params}&apikey=#{api_key}")
    end

    def url_base
      ENV.fetch('OMDB_URL', nil)
    end

    def api_key
      ENV.fetch('OMDB_API', nil)
    end
  end
end
