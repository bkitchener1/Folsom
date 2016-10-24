@COP-19
  @full_cart
Feature:  Cart Order Confirmation Page Ask a Question

  @desktop
Scenario: User wants to ask a question
  Given I visit the order confirmation page
  When I click the got a question box
  Then a new browser window displays and goes to the liveperson site


  @mobile @tablet
Scenario: User doesn't see ask a question box in mobile breakpoints (<720px)
  When I visit the order confirmation page
  Then the got a question box does not display