module Omdb
  class SearchService < Base
    private

    def desired_response
      response_object[:Search]
    end

    def request_params
      "s=#{term}"
    end
  end
end
