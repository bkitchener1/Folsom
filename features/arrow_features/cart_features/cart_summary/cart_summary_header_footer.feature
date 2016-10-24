@TEL-1771
  @full_cart
Feature:  Cart Summary Header / Footer

  @desktop
Scenario: As a desktop user, when I get to the cart summary page, I want to see the full arrow header
  Given I visit the cart summary page
  Then The arrow header should be visible
  And The arrow footer should be visible

  @tablet
Scenario: As a tablet user, when I get to the cart summary page, I want to see the header but no footer
  Given I visit the cart summary page
  Then The arrow header should be visible
  And The arrow footer should not be visible

  @mobile
Scenario: As a mobile user, when I get to the cart summary page, I do not see the footer
  Given I visit the cart summary page
  Then The arrow header should be visible
  And The arrow footer should not be visible


  