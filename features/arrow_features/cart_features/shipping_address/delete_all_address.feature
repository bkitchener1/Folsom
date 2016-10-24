Feature: Delete Shipping Address

  #only used to clear data, do not run as part of regression suite
  @skip @desktop @full_cart
  Scenario: User deletes all addresses
    Given I visit the shipping address page
    And I delete all addresses
