#this feature is built very basic for now and may need more functionality added as the feature progresses
@ARW-614
@desktop @mobile @tablet
  @full

  Feature: Header Ad Banner

    Scenario: User should see the Ad banner on Desktop and should NOT see it on mobile/tablet
        Given I visit the Arrow Home Page
        Then I should see a Ad banner in the header on desktop only

