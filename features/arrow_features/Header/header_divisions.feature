@ARW-626
@desktop
@full @smoke @qa_only

Feature: Header Arrow Divisions CTAs

# This feature navigates to the homepage and verifies that the Arrow Divisions tab is visible
# It then selects the tab and verifies each division and its URL link

# Computing Solutions
  Scenario: Expanding the Arrow Divisions menu and selecting the Computing Solutions category
    Given I 'Enable' the Feature Flag  'NewHeader' as user one
    And I visit the Arrow Home Page
    Then The new Arrow header should be displayed correctly
    And I can see an updated Arrow Divisions CTA
    When I select the Arrow Divisions tab
    Then I should see the Arrow Divisions menu
    When I select the computing solutions category
    Then I should be on the Computing Solutions division page

# Electronic Components
  Scenario: Expanding the Arrow Divisions menu and selecting the Electronic Components category
    Given I 'Enable' the Feature Flag  'NewHeader' as user one
    And I visit the Arrow Home Page
    Then The new Arrow header should be displayed correctly
    And I can see an updated Arrow Divisions CTA
    When I select the Arrow Divisions tab
    Then I should see the Arrow Divisions menu
    And I select the Electronic Components category
    Then I should be on the Electronic Components division page

# OEM Computing Solutions
  Scenario: Expanding the Arrow Divisions menu and selecting the OEM Computing Solutions category
    Given I 'Enable' the Feature Flag  'NewHeader' as user one
    And I visit the Arrow Home Page
    Then The new Arrow header should be displayed correctly
    And I can see an updated Arrow Divisions CTA
    When I select the Arrow Divisions tab
    Then I should see the Arrow Divisions menu
    And I select the OEM Computing Solutions category
    Then I should be on the OEM Computing Solutions division page

# Arrow Value Recovery
  Scenario: Expanding the Arrow Divisions menu and selecting the Arrow Value Recovery category
    Given I 'Enable' the Feature Flag  'NewHeader' as user one
    And I visit the Arrow Home Page
    Then The new Arrow header should be displayed correctly
    And I can see an updated Arrow Divisions CTA
    When I select the Arrow Divisions tab
    Then I should see the Arrow Divisions menu
    And I select the Arrow Value Recovery category
    Then I should be on the Arrow Value Recovery division page
