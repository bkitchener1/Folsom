class GenericApi < BaseApi
  attr_reader :uri, :response, :json

  def initialize(uri)
    @uri = uri
    execute_api_request
  end

end