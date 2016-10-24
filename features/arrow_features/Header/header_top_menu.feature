Feature: Header Top Menu


  @desktop @smoke @full @qa_only
  Scenario: Verifying Products Link in top menu
    Given I 'Enable' the Feature Flag  'NewHeader' as user two
    And I visit the Arrow Home Page
    And click "Products" with the hamburger menu open
    Then I should be on the "Products" page

  @desktop @smoke @full @qa_only
  Scenario: Verifying Datasheets Link in top menu
    Given I 'Enable' the Feature Flag  'NewHeader' as user three
    And I visit the Arrow Home Page
    And click "Datasheets" with the hamburger menu open
    Then I should be on the "Datasheets" page

  @desktop @smoke @full @qa_only
  Scenario: Verifying Reference Designs Link in top menu
    Given I 'Enable' the Feature Flag  'NewHeader' as user four
    And I visit the Arrow Home Page
    And click "Reference Designs" with the hamburger menu open
    Then I should be on the "Reference Designs" page

  @desktop @smoke @full @qa_only
  Scenario: Verifying Design Center Link in top menu
    Given I 'Enable' the Feature Flag  'NewHeader' as user one
    And I visit the Arrow Home Page
    And click "Design Center" with the hamburger menu open
    Then I should be on the "Design Center" page

  @mobile @tablet @smoke @full @qa_only
  Scenario: Verifying Products Link in hamburger menu
    Given I 'Enable' the Feature Flag  'NewHeader' as user two
    And I visit the Arrow Home Page
    When I click the hamburger menu in the header
    And click "Products" with the hamburger menu open
    Then I should be on the "Products" page

  @mobile @tablet @smoke @full @qa_only
  Scenario: Verifying Datasheets Link in hamburger menu
    Given I 'Enable' the Feature Flag  'NewHeader' as user three
    And I visit the Arrow Home Page
    When I click the hamburger menu in the header
    And click "Datasheets" with the hamburger menu open
    Then I should be on the "Datasheets" page

  @mobile @tablet @smoke @full @qa_only
  Scenario: Verifying Reference Designs Link in hamburger menu
    Given I 'Enable' the Feature Flag  'NewHeader' as user four
    And I visit the Arrow Home Page
    When I click the hamburger menu in the header
    And click "Reference Designs" with the hamburger menu open
    Then I should be on the "Reference Designs" page

  @mobile @tablet @smoke @full @qa_only
  Scenario: Verifying Design Center Link in hamburger menu
    Given I 'Enable' the Feature Flag  'NewHeader' as user one
    And I visit the Arrow Home Page
    When I click the hamburger menu in the header
    And click "Design Center" with the hamburger menu open
    Then I should be on the "Design Center" page