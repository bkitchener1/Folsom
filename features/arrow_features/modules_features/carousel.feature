@desktop
Feature: Carousel Module

  Background:
    Given I visit the Products Landing Page

  @BKT_1159 @smoke @full
  Scenario: The entire Carousel Slide is a link that matches the first CTA link
    Then The entire Carousel item is linkable
    And The Carousel link matches the first CTA link

  @BKT_1159 @full
  Scenario: The entire Carousel slide is linkable
    Then The Carousels linkable area matches the dimensions of the Slide
