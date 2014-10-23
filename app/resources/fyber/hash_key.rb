module Fyber
  class HashKey
    attr_reader :params

    API_KEY = 'b07a12df7d52e6c118e5d47d3f9e60135b109a1f'

    def initialize(request_params)
      @params = request_params.sort.to_h
    end

    def generate
      Digest::SHA1.hexdigest("#{@params.to_query}&#{API_KEY}")
    end
  end
end