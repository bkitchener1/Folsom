Feature: CrossReferencesModule

  @ARROW_193 @full @desktop @max @tablet @mobile
  Scenario: User can see Cross References Module on Product Detail Page on different devices
    And I visit a Part Detail with Cross References
    Then I can see the Cross Reference Module
    And I can see Cross References Module Heading
    And I can see the 'share,save' icons on the module
    And The Buy button for a Cross Ref Product should link to Product Detail Page
