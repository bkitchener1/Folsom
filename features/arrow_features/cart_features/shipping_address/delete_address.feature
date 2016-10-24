@TEL-2095
@desktop @mobile @tablet
  @full_cart
Feature: Delete Shipping Address

Scenario: User deletes a shipping addresses
  Given I log in with the third user
  And I have an item in my cart
  And I click the checkout button
  When I click the add new address link
  And I enter "Chris Hancock" into field "name"
  And I enter "Arrow" into field "company"
  And I enter "3035555555" into field "phone"
  And I select "United States of America" as the country
  And I enter "123 Broadway" into field "address"
  And I enter "Westminster" into field "city"
  And I enter "80031" into field "zip"
  And I enter "chhancock@arrow.com" into field "email"
  And I click update
  And I visit the Shipping Address page
  When I click the trash can icon on the first address
  Then I should see the delete item modal with confirmation text
  And I click update
  Then the address "123 Broadway" should not be present

Scenario: User deletes all addresses
  Given I visit the shipping address page
  And I delete all addresses
  Then I should see a Message saying you do not have any address on file should be present
  And the Add New Address button should be present
  When I click the continue checkout button
  Then I should see an error message telling me to select an address
