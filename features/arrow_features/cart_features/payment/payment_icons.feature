@COP-166
@desktop @mobile @tablet
@full_cart

    Feature: Clicking on the Payment icons should set the drop down box

        Scenario: If I visit the payment page as a non-Terms user and click the payment icons, the drop down box should set to that type of payment
          Given I visit the payment page as the second user
          And I click the "PayPal" Icon
          Then The Payment Method drop down should set to "PayPal"
          When I click the "Visa" Icon
          Then The Payment Method drop down should set to "Credit Card"
          When I click the "Swift" Icon
          Then The Payment Method drop down should set to "Wire Transfer"
          When I click the "MasterCard" Icon
          Then The Payment Method drop down should set to "Credit Card"
          When I click the "PayPal" Icon
          And I click the "AMEX" Icon
          Then The Payment Method drop down should set to "Credit Card"
          When I click the "Swift" Icon
          And I click the "Discover" Icon
          Then The Payment Method drop down should set to "Credit Card"

      @qa_only
      Scenario: If I visit the payment page as a Terms user and click the payment icons, the drop down box should set to that type of payment
        Given I visit the payment page as a terms user
        And I click the "PayPal" Icon
        Then The Payment Method drop down should set to "PayPal"
        When I click the "Visa" Icon
        Then The Payment Method drop down should set to "Credit Card"
        When I click the "Swift" Icon
        Then The Payment Method drop down should set to "Wire Transfer"
        When I click the "MasterCard" Icon
        Then The Payment Method drop down should set to "Credit Card"
        When I click the "Arrow Credit" Icon
        Then The Payment Method drop down should set to "Terms"
        And I click the "AMEX" Icon
        Then The Payment Method drop down should set to "Credit Card"
        When I click the "Swift" Icon
        And I click the "Discover" Icon
        Then The Payment Method drop down should set to "Credit Card"








