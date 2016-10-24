Feature: Social Share Modal
  As a User I want Pinterest to be added to my Social Share options

  @BKT_1234 @smoke @full @desktop
  Scenario: Users can Share an Article using Pinterest
    Given I enable the Feature Flag 'PinterestSocialShareButton'
    And I visit a News Article on the Arrow site
    And I click on the Social Share icon of the Article
    Then I can see the Social Share Modal
    And I can see a Pinterest Share icon
    And I can see 5 social share options

