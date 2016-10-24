@api_dependent
Feature: EmbeddedSearchModule

  @ARROW_860 @full @desktop
  Scenario: Users can Search for Products using the Embedded Search Module on the Products Landing Page
    And I visit the Products Landing Page
    When I Search the Arrow site for "bav" using the Embedded Search module
    Then I am directed to the Products Search Results Page
    Then My search term displays in the Search field


  @ARROW_1389 @full @smoke @desktop
  Scenario Outline: The Embedded Search will submit a search with the correct form action
    Given I visit the "<page>" Landing Page
    Then The Embedded Search Module has a form action of "<form_url>"

    Examples:
      | page                | form_url                    |
      | Event               | /research-and-events/search |
      | Research and Events | /research-and-events/search |
      | Videos              | /research-and-events/search |
      | Reference Design    | /reference-designs/search  |
      | Products            | /products/search            |


  @ARROW_1387 @ARROW_1389 @full @desktop
  Scenario Outline: When I search using the Embedded Search module from the Research and Events Landing pages I'm then redirected to the Content Search page and my search is pre-filtered
    Given I visit the "<page>"
    When I Search the Arrow site for "event" using the Embedded Search module
    And The Search Filter with value "<filter_value>" is Checked
    And The URL filter parameter should change to include "<url_filter_param>"

    Examples:
      | page                  | filter_value | url_filter_param  |
      | EventsLandingPage     | Event        | contentType%3Aevent%3B |
      | NewsLandingPage       | Articles     | contentType%3Anews%3B  |
      | VideoLandingPage      | Videos       | contentType%3Avideo%3B |

  @ARROW_862 @full @desktop
  Scenario: Users can Search for Reference Designs using the Embedded Search Module on the Ref Designs Landing Page
    Given I visit the Reference Design Landing Page
    When I Search the Arrow site for "test" using the Embedded Search module
    Then I am directed to the Reference Design Listings Page
    Then My search term displays in the Search field

  @ARROW_850 @full @desktop
  Scenario: User can search for products using the Embedded Search Module on Datasheets Landing Page on All Devices
    Given I visit the Datasheets Landing Page
    When I Search the Arrow site for "test" using the Embedded Search module
    Then I am directed to the Products Search Results Page
    And My search term displays in the Search field
