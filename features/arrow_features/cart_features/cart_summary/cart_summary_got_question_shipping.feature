@COP-19
  @full_cart
Feature:  Cart Shipping Address Page Ask a Question

  @desktop
Scenario: User wants to ask a question
  Given I am on the cart shipping address' page
  When I click the got a question box
  Then a new browser window displays and goes to the liveperson site

  @mobile @tablet
Scenario: User doesn't see ask a question box in mobile breakpoints (<720px)
  When I am on the cart shipping address' page
  Then the got a question box does not display