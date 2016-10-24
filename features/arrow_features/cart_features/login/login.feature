@desktop @mobile @tablet

  @full_cart @cart_smoke

Feature:  Arrow Login Page

Scenario: As a user when I log into arrow.com, I don't want to have to log in during checkout again

  # updated to quantity 50 from 3000 as this is login test

  Given I login to arrow.com
  And I visit the arrow website
  And I add "50" items with part number "1340091S9715673N7769"
  And I visit the cart summary page
  And I click the checkout button
  Then I should be on the shipping address page

Scenario: As a user, when I log in during checkout I don't want to log in again on arrow.com
  Given I visit the arrow website
  And I add "50" items with part number "1340091S9715673N7769"
  And I visit the cart summary page
  And I click the checkout button
  And I log in with the default user
  When I visit the arrow website
  Then I should be logged in