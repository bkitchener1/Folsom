@desktop @mobile @tablet
  @full_cart
Feature: View Shipping method selected on the Place order page

  Scenario: User sees shipping method selected during checkout on Place order page when order only has 1 product shipping from US Origin
    Given I visit the arrow login page
    And I login to arrow.com
    Then I have a shopping cart to place my order for US origin item
    And the place order page shipping method displays "1 item ships from US Origin"
   # And the place order page shipping method displays the shipping method selected earlier
    And the place order page shipping method displays the shipping method selected earlier "Federal Express Ground Service (1 to 5 Days) $0.00"


  Scenario: User sees shipping method selected during checkout on Place order page when order only has 1 product shipping from Non-US Origin
    Given I visit the arrow login page
    And I login to arrow.com
    And I have a shopping cart to place my order for Non-US origin item
    And the place order page shipping method displays Non-US "1 item ships from Non-US Origin"
   # And the place order page shipping method displays the Non-US shipping method selected earlier
    And the place order page shipping method displays the Non-US shipping method selected earlier "DHL Express World Wide Service $43.99"

  Scenario: User sees shipping method selected during checkout on Confirmation page when order only has 2 products
    Given I visit the arrow login page
    And I login to arrow.com
    And I have a shopping cart to place my order with two products
    And the place order page shipping method displays "1 item ships from US Origin"
    And the place order page shipping method displays Non-US "1 item ships from Non-US Origin"
    And the place order page shipping method displays the shipping method selected earlier "Federal Express Ground Service (1 to 5 Days) $0.00"
    And the place order page shipping method displays the Non-US shipping method selected earlier "DHL Express World Wide Service $43.99"







