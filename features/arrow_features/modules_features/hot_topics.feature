Feature: Hot Topics feature

  @ARROW_1307 @full @smoke @mobile @phablet @tablet @desktop @wide
  Scenario: User can see the heading for Hot Topics list block
    And I visit the Research and Events Landing Page
    Then I can see the Hot Topic heading

  @ARROW_1307 @full @mobile @phablet @tablet @desktop @wide
  Scenario: User can see the section heading for Hot Topic list block sections
    And I visit the Research and Events Landing Page
    Then I can see the first subsection
    And I can see the heading for the first subsection

