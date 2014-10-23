module Fyber
  class HashKey
    attr_reader :params

    def initialize(request_params)
      @params = request_params.sort.to_h
    end

    def generate
      payload = "#{@params.to_query}&#{Fyber::APISettings.api_key}"
      Digest::SHA1.hexdigest(payload)
    end
  end
end
