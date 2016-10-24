@COP-23
@desktop @mobile @tablet
  @full_cart

 Feature: Order Summary should appear on all the checkout pages


   Scenario: Order Summary on Cart Page
     Given I visit the cart summary page
     Then The Order Summary should be displayed
     And The Total should be displayed
     And A message about adding a promotional code at the end of checkout

   Scenario: Order Summary on Shipping Address Page
     Given I visit the shipping address page
     Then The Order Summary should be displayed
     And The Total, Item Total, Shipping, and Tax should be displayed
     And A message about adding a promotional code at the end of checkout

   Scenario: Order Summary on Shipping Method Page
     Given I visit the shipping method page
     Then The Order Summary should be displayed
     And The Total, Item Total, Shipping, and Tax should be displayed
     And A message about adding a promotional code at the end of checkout

   Scenario: Order Summary on Payment Page
     Given I visit the payment page
     Then The Order Summary should be displayed
     And The Total, Item Total, Shipping, and Tax should be displayed
     And A message about adding a promotional code at the end of checkout

    Scenario: Order Confirmation Page
      Given I visit the order confirmation page
      Then The Order Summary should be displayed
      And The Total, Item Total, Shipping, and Tax should be displayed


