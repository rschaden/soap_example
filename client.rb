require 'lolsoap'
require 'httpclient'

class Client
  attr_reader :http_client, :client

  def initialize
    @http_client = HTTPClient.new
    @client = LolSoap::Client.new(http_client.get(wsdl).body)
  end

  def perform(operation, x, y)
    request = client.request(operation)

    request.body do |body|
      body.x x
      body.y y
    end

    response(request)
  end

  private

  def response(request)
    raw_response = http_client.post(request.url,
                                    request.content,
                                    request.headers)
    response = client.response(request, raw_response.body)
    response.body_hash["Result"].to_f
  end

  def wsdl
    'http://soaptest.parasoft.com/calculator.wsdl'
  end
end
