Feature: Favicon
  As a user I want to view arrows favicon so I can easily distinguish the website if I have many tabs open

Background:
  Given I visit the Arrow Home Page

  @ARROW_422 @full @desktop
  Scenario: Favicon is correctly displayed on all browsers
    Then The html contains a Favicon link
  @ARROW_422 @full @mobile
  Scenario: Favicon is correctly displayed on retina iOS devices
    Then The html contains a Favicon link for iOS