module Fyber
  class ResponseSignature
    attr_reader :response
    delegate :headers, :body, to: :response, prefix: true

    def initialize(response)
      @response = response
    end

    def valid?
      body_signature == header_signature
    end

    private

    def body_signature
      Digest::SHA1.hexdigest("#{raw_response}#{Fyber::APISettings.api_key}")
    end

    def header_signature
      response_headers['x-sponsorpay-response-signature']
    end

    def raw_response
      JSON.dump(response_body)
    end
  end
end