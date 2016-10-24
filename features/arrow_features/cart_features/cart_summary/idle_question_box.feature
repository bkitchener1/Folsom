@TEL-1920 @ARW-659
  @full
Feature:  Cart Summary Chat With Us Live

#This Feature navigates to the Cart Summary page,
#waits for the "Chat With Us Live" box appears (10 Sec)
#then, selects the button and verifies navigation to liveperson new window.

  @desktop
Scenario: User wants to ask a question
  Given I visit the cart summary page
  When I click the chat with us live box
  Then a new browser window displays and goes to the liveperson site

  @mobile @tablet
Scenario: User doesn't see ask a question box in mobile breakpoints (<720px)
  When I visit the cart summary page
  Then the chat with us live box does not display