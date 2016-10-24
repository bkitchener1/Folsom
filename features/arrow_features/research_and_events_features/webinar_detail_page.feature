Feature: WebinarDetailPageFeature

  @ARROW_1359 @full @smoke @max
  Scenario: User can see webinar detail page
    Given I visit the Webinar Detail Page
    Then I can see the Webinar Title
    And I can see Webinar 'add to project' button
    And I can see Webinar article

