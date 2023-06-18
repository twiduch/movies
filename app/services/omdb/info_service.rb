module Omdb
  class InfoService < Base
    private

    def request_params
      "i=#{term}"
    end
  end
end
