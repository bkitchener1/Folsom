class HealthCheck < BaseApi

  def initialize
    @uri = "#{$base_url}/healthcheck/cairoAPI"
  end


end