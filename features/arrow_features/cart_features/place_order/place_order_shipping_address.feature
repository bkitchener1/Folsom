@COP-29
@desktop @mobile @tablet
  @full_cart
Feature: View Shipping address selected on the Place order page

  Scenario: User sees shipping address selected during checkout on Place order page
    Given I visit the arrow login page
    And I login to arrow.com
    Then I have a shopping cart to place my order for US origin item
    #And the place order page shipping address displays the shipping address selected earlier
    Then place order page shipping address should display "Test User"
    Then place order page shipping address should display "Aspenware"
    Then place order page shipping address should display "3033122135"
    Then place order page shipping address should display "S ColoradoDenver"
    Then place order page shipping address should display "AL 80246-8001"