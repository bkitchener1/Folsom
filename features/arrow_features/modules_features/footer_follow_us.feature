

@ARW-3899 @smoke @full @mobile @desktop @tablet
Feature: Follow us on social media links

  Scenario: Follow us on social media Twitter
   When I visit the Arrow Home Page
    Then I should see follow us on social media buttons in the footer
    When I click the follow us on Twitter button
    Then I should be directed to the proper Arrow Twitter url

  Scenario: Follow us on social media YouTube
   When I visit the Arrow Home Page
   And I click the follow us on YouTube button
    Then I should be directed to the proper Arrow YouTube url

  Scenario: Follow us on social media Facebook
    When I visit the Arrow Home Page
    And I click the follow us on Facebook button
    Then I should be directed to the proper Arrow Facebook url

  Scenario: Follow us on social media LinkedIn
    When I visit the Arrow Home Page
    And I click the follow us on LinkedIn button
   Then I should be directed to the proper Arrow LinkedIn url

  Scenario: Follow us on social media Google+
    When I visit the Arrow Home Page
   And I click the follow us on Goggle+ button
    Then I should be directed to the proper Arrow Google+ url