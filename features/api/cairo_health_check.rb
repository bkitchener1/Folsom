class CairoHealthCheck < BaseApi
  def initialize
    @uri = "http://#{FigNewton.cairo_healthcheck_user_name}:#{FigNewton.cairo_healthcheck_user_password}@cairo2.arrow.com/HealthCheck/Check"
    execute_api_request
  end

end