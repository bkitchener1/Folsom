@COP-4
@desktop
# @mobile @tablet

@full_cart @cart_smoke


Feature:  Add Shipping Address

# added new field

   Scenario Outline: User can add a new address with different shipping types
    Given I visit the shipping address page
    When I click the add new address link
    And I select address type for other options in drop down "<type>"
    And I enter "Test User" into field "name"
    And I enter "Aspenware" into field "company"
    And I enter "3033122135" into field "phone"
    And I select "United States of America" as the country
    And I enter "123 S Colorado" into field "address"
    And I enter "Denver" into field "city"
    And I enter "80113" into field "zip"
    And I enter "b.kitchener@aspenware.com" into field "email"
    And I click update
    And I select existing address "123 S Colorado"
    Then I click the checkout button
     Examples:
      |type|
      |  1 |
      |  2 |
      |  3 |
      |  4 |

  Scenario: User can add a new address with direct consumer
    Given I visit the shipping address page
    When I click the add new address link
    And I select address type "0"
    And I enter "Test User" into field "name"
    And I enter "Aspenware" into field "company"
    And I enter "3033122135" into field "phone"
    And I select "United States of America" as the country
    And I enter "123 S Colorado" into field "address"
    And I enter "Denver" into field "city"
    And I enter "80113" into field "zip"
    And I enter "b.kitchener@aspenware.com" into field "email"
    And I click update
    And I select existing address "123 S Colorado"
    Then I click the checkout button

    # updated for form level required errors

  Scenario: Required fields display an error
    Given I visit the add new shipping address modal
    When I click the update button
    Then the "Address type" field should show that it is required
    #Then the "name" field should show that it is required
   # And the "postalCode" field should show that it is required
    #And the "street1" field should show that it is required
    #And the "city" field should show that it is required
   # And the "phone1" field should show that it is required

  Scenario: The country is broken into two groups.
    Given I visit the add new shipping address modal
    Then the country dropdown should contain sections called "Common Countries" and "All countries"
    And each section in the country dropdown should be sorted alphabetically

  Scenario: Only display the reseller certificatesection if the country is USA
    Given I visit the add new shipping address modal
    When I select country "United States of America"
    Then the reseller certificate should be visible
    When I select country "Albania"
    Then the reseller certificate should not be visible

  Scenario: The state field should be a dropdown if the country is USA
    Given I visit the add new shipping address modal
    When I select country "United States of America"
    Then the state field should be a dropdown
    When I select country "Taiwan"
    Then the state field should be a text field

  Scenario: If the country is CN (China), replace the VAT ID label with CR Code
    Given I visit the add new shipping address modal
    When I select country "China"
    Then the CR Code field should be visible
    When I click update
    Then the "crcode" field should show that it is required as form level error message

  Scenario: VAT ID field is optional
    Given I visit the add new shipping address modal
    When I select country "Austria"
    Then the VAT ID field should be visible
    When I click update
    And the "vat" field should show that it is not required at form level and no error

  Scenario: For non-US countries, the label for state should be 'State/Province',
    Given I visit the add new shipping address modal
    When I select country "Taiwan"
    Then the state field should be a text field and have label "State / Province"

  Scenario: Postal code is required for some countries
    Given I visit the add new shipping address modal
    When I select country "Albania"
    And I click update
    Then the "postalCode" field should show that it is required at form level

  Scenario: Postal code is optional for some countries
    Given I visit the add new shipping address modal
    When I select country "Bahamas"
    When I click update
    And the "postalCode" field should show that it is not required at form level

  Scenario: When USA is selected, the State dropdown should default to Alabama
    Given I visit the add new shipping address modal
    Then the state dropdown should display "Alabama"
