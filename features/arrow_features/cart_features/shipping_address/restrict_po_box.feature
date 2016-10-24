@ARW-740
@desktop
# @mobile @tablet
@full_cart

Feature:  Restrict addition of a P.O. Box Shipping Address

# This Feature is to ensure a user cannot add a P.O. Shipping Address to their account
# It will run through the Add account/ Edit account scenarios inputting a variation of a P.O Box into the address field
# Then it verifies the error message upon update.click

# added new field

   Scenario Outline: User can not add a new address using a P.O Box in line 1
    Given I visit the shipping address page
# Logic is taking user to homepage after login instead of previous page. Adding corrective steps
    Then I visit the cart summary page
    And I click the checkout button

    When I click the add new address link
    And I select address type for other options in drop down "1"
    And I enter "Test User" into field "name"
    And I enter "Aspenware" into field "company"
    And I enter "3033122135" into field "phone"
    And I select "United States of America" as the country
    And I enter "<type>" into field "address"
    And I enter "Denver" into field "city"
    And I enter "80113" into field "zip"
    And I enter "b.kitchener@aspenware.com" into field "email"
    And I click update
    Then I should see the PO Box error message
     Examples:
      |  type            |
      |  PO Box          |
      |  P.O. Box        |
      |  POBox           |
      |  P.O.Box         |
      |  Post Office Box |


 Scenario Outline: User can not add a new address using a P.O Box in line 2
  Given I visit the shipping address page
  # Logic is taking user to homepage after login instead of previous page. Adding corrective steps
  Then I visit the cart summary page
  And I click the checkout button

  When I click the add new address link
  And I select address type for other options in drop down "1"
  And I enter "Test User" into field "name"
  And I enter "Aspenware" into field "company"
  And I enter "3033122135" into field "phone"
  And I select "United States of America" as the country
  And I enter "123 Here" into field "address"
  And I enter "<type>" into field "address2"
  And I enter "Denver" into field "city"
  And I enter "80113" into field "zip"
  And I enter "b.kitchener@aspenware.com" into field "email"
  And I click update
  Then I should see the PO Box error message
   Examples:
    |  type            |
    |  PO Box          |
    |  P.O. Box        |
    |  POBox           |
    |  P.O.Box         |
    |  Post Office Box |



 Scenario Outline: Using the pencil icon, an address can not be updated with a P.O Box
  Given I visit the shipping address page
  # Logic is taking user to homepage after login instead of previous page. Adding corrective steps
  Then I visit the cart summary page
  And I click the checkout button

  And I have already added an address
  When I edit existing address "123 S Colorado"
  And I enter "<type>" into field "address2"
  And I enter "Northshore" into field "city"
  And I enter "Edited User" into field "name"
  And I enter "ARROW" into field "company"
  And I enter "5555555555" into field "phone"
  And I select "United States of America" as the country
  And I enter "80202" into field "zip"
  And I enter "editeduser@mailinator.com" into field "email"
  And I click update
  Then I should see the PO Box error message
   Examples:
    |  type            |
    |  PO Box          |
    |  P.O. Box        |
    |  POBox           |
    |  P.O.Box         |
    |  Post Office Box |