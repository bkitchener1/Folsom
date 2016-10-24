@COP-11
@desktop @mobile @tablet
  @full_cart

  Feature: View Billing Address

    Scenario: Correct layout is shown to the user
      Given I visit the payment page as the second user
      And I have added 6 addresses
      Then the addresses should display in the correct layout

    Scenario: As a user, I want to be able to easily tell which address I have selected
      Given I visit the payment page as the second user
      When I select the default address
      Then the default address should be selected and highlighted

    Scenario: Reseller certificate field only displays if country is USA.
      Given I visit the payment page as the second user
      And I click the add new address link
      When I select country "United States of America"
      Then the add reseller certificate button should be visible
      When I select country "India"
      Then the add reseller certificate button should not be visible

    Scenario: Some international addresses will also have a VAT ID (example UK).
      Given I visit the payment page as the second user
      And I have an address from the UK
      Then the address from the UK should display VAT ID "GD001"

    Scenario: If the address is marked as isTermsAddress, then instead of the edit/delete buttons it displays text that simply says 'terms'
      Given I visit the payment page as a terms user
      Then I should see a terms address