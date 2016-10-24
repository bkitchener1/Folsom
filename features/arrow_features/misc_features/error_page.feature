@desktop
Feature: ErrorPage
  As an user I want a 404 error page so I am notified when an the page does not exist (desktop, mobile & tablet)

  @ARROW_646 @full @smoke
  Scenario: User can see a graceful 404 Page when they visit a Page that cannot be found on the Arrow Site
    Given I visit the Arrow Error Page
    And I can see an Error Header
    And I can see an Error Info
    And I can see useful Info to help me

