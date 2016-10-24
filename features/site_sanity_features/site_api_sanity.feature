@desktop @sanity @qa_only
Feature: SiteAPISanity
  As s User
  I can see Arrow Landing Pages without exception

  @sanity
  Scenario: Pricing API is up
    When I log in to Sitecore as an administrator
    And I request the pricing API
    Then The pricing API is returning correctly

  @sanity
  Scenario Outline: Arrow Website API Sanity
    Given I request the api '<api_url>'
    And The API loads without Errors

    Examples:
      | api_url                           |
      | /api/carthandover                 |
      | /api/megamenu/latestarticles      |
      | /api/carthandover                 |
      | /api/megamenu/newreferencedesigns |
      | /api/megamenu/latestdatasheets    |

  Scenario: Arrow API Health Check page has no errors
    When I log in to Sitecore as an administrator
    Then I should see no errors on the Health Check page

