Feature: SEO Tags

  @ARW_963 @smoke @full @desktop @skip
  Scenario: Product Specific Datasheet page should NOT have rel='canonical'
    Given I visit the Datasheets Detail page
    Then The Robots Meta Tag has a noindex,follow Content attribute
    And There is a Canonical Link