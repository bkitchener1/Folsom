And(/^I log in to paypal$/) do
  page = PaypalPage.new
  page.login("c.igo@aspenware.com","Aspenware1")
end

And(/^I log in to paypal and complete my payment$/) do
  page = PaypalPage.new
  page.login("c.igo@aspenware.com","Aspenware1")
  page.pay
end