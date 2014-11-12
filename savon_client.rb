require 'savon'
class SavonClient
  attr_reader :client

  def initialize
    @client = Savon.client(wsdl: wsdl)
  end

  def perform(operation, x, y)
    response = client.call(:add, message: { 'add0In' => {'x' =>  x, 'y' => y } })
  rescue => e
    require 'pry';binding.pry
  end

  def wsdl
    'http://soaptest.parasoft.com/calculator.wsdl'
  end
end
