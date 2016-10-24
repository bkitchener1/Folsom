@COP-5
@mobile @tablet @desktop
  @full_cart
Feature:  Edit Shipping Address

Scenario: Edit form is prepopulated with data
  Given I visit the shipping address page
  When I edit existing address "123 S Colorado"
  Then the address modal should have field "address" with value "123 S Colorado"
  And the address modal should have field "name" with value "Test User"
  And the address modal should have field "zip" with value "80246-8001"
  And the address modal should have field "company" with value "Aspenware"
  And the address modal should have field "phone" with value "3033122135"
  And the address modal should have field "country" with value "United States of America"
  And the address modal should have field "city" with value "Denver"

  @cart_smoke
Scenario: Address can be updated
  Given I visit the shipping address page
  And I have already added an address
  When I edit existing address "123 S Colorado"
  And I enter "555 Incipio Ave" into field "address"
  And I enter "Northshore" into field "city"
  And I enter "Edited User" into field "name"
  And I enter "ARROW" into field "company"
  And I enter "5555555555" into field "phone"
  And I select "United States of America" as the country
  And I enter "80202" into field "zip"
  And I enter "editeduser@mailinator.com" into field "email"
  And I click update
  Then the address "555 Incipio Ave" should be present


Scenario: Cancelling an update does not save
  Given I visit the shipping address page
  And I have already added an address
  When I edit existing address "123 S Colorado"
  When I enter "1000 Rockford Ave" into field "address"
  And I click cancel
  Then the address "1000 Rockford Ave" should not be present
