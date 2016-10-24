@COP-10
@desktop

@full_cart
@cart_smoke

Feature:  Add billing address test

  # update for shipping type to select ultimate consignee


  @cart_smoke
  Scenario: User can add a new address
    Given I visit the payment page
    When I click the add new address link
    And I select address type "0"
    And I enter "Test User 2" into field "name"
    And I enter "Aspenware" into field "company"
    And I enter "3033122135" into field "phone"
    And I select "United States of America" as the country
    And I enter "123 S Colorado" into field "address"
    And I enter "Denver" into field "city"
    And I enter "80113" into field "zip"
    And I enter "testuser2@mailinator.com" into field "email"
    And I click update
    And I select existing address "123 S Colorado"
    Then I click the checkout button

    # updated code for form level error message, field level is not implemented


  @cart_smoke
  Scenario: Required fields display an error
    Given I visit the payment page as the second user
    And I click the add new address link
    When I click the update button
    Then the "Address type" field should show that it is required at form level error
    #Then the "name" field should show that it is required
    #And the "postalCode" field should show that it is required
    #And the "street1" field should show that it is required
    # And the "city" field should show that it is required
   # And the "phone1" field should show that it is required

  Scenario: The country is broken into two groups.
    Given I visit the payment page as the second user
    And I click the add new address link
    Then the country dropdown should contain sections called "Common Countries" and "All countries"
    And each section in the country dropdown should be sorted alphabetically

  Scenario: Only display the reseller certificate section if the country is USA
    Given I visit the payment page as the second user
    And I click the add new address link
    When I select country "United States of America"
    Then the reseller certificate should be visible
    When I select country "Albania"
    Then the reseller certificate should not be visible

  Scenario: The state field should be a dropdown if the country is USA
    Given I visit the payment page as the second user
    And I click the add new address link
    When I select country "United States of America"
    Then the state field should be a dropdown
    When I select country "Taiwan"
    Then the state field should be a text field

    # update for form level error message

  Scenario: If the country is CN (China), replace the VAT ID label with CR Code, and it become a required field. The CR Code gets stored in the VatID field.
    Given I visit the payment page as the second user
    And I click the add new address link
    When I select country "China"
    Then the CR Code field should be visible
    When I click update
    #Then the "crcode" field should show that it is required
    Then the "crcode" field should show that it is required as form level error message

    # update for form level error message

  Scenario: VAT ID field is optional
    Given I visit the payment page as the second user
    And I click the add new address link
    When I select country "Austria"
    Then the VAT ID field should be visible
    When I click update
   # And the "vat" field should show that it is not required
    And the "vat" field should show that it is not required at form level and no error

  Scenario: For non-US countries, the label for state should be 'State/Province'
    Given I visit the payment page as the second user
    And I click the add new address link
    When I select country "Taiwan"
    Then the state field should be a text field and have label "State / Province"

    # update for form level error message

  Scenario: Postal code is required for some countries
    Given I visit the payment page as the second user
    And I click the add new address link
    When I select country "Albania"
    And I click update
    #Then the "postalCode" field should show that it is required
    Then the "postalCode" field should show that it is required at form level

  Scenario: Postal code is optional for some countries
    Given I visit the payment page as the second user
    And I click the add new address link
    When I select country "Bahamas"
    When I click update
    #And the "postalCode" field should show that it is not required
    And the "postalCode" field should show that it is not required at form level

  Scenario: When USA is selected, the State dropdown should default to Alabama
    Given I visit the payment page as the second user
    And I click the add new address link
    Then the state dropdown should display "Alabama"
