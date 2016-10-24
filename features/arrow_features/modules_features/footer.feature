@desktop
Feature: Footer

  As a user
  I want to see a the Footer section with specific functionality.

  Background:
    Given I visit the Arrow Home Page

  @smoke @full
  Scenario: The Footer is displayed/visible
    Then I can see the Footer

  @ARROW_107 @smoke @full
  Scenario: The Footer Divisions section has an Arrow image
    Then I can see the Arrow image in the Footer Divisions section

  @ARROW_107 @full @cms_dependent
  Scenario: The Footer Divisions has some Links
    Then I can see links in the Footer Divisions section

  @ARROW_108 @smoke @full
  Scenario: Users can see the Copyright text in the Footer
    Then I can see the Copyright text in the Footer's secondary section


