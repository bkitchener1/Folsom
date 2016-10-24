class GetPendingSalesOrder < BaseApi

  def initialize
    @uri = "#{$cart_url}/server-webapp/api/getPendingSalesOrder?format=json"
    execute_api_request
  end

  def total
    @json[:total]
  end

  def subtotal
    @json[:subtotal]
  end

  def tax_total
    @json[:tax]
  end

  def wire_transfer
    @json[:wireTransferFee]
  end

  def shipping_total
    @json[:shippingFee]
  end
end