Feature: Breadcrumb

  @ARROW_1062 @smoke @full @tablet @mobile
  Scenario: Page Breadcrumbs don't display on Mob and Tablet
   # Given I visit the Products Landing Page
    Then I should NOT see a Breadcrumb

  @ARROW_1062 @full @ARROW_1776 @desktop
  Scenario: The Breadcrumb does NOT contain a Back link when there is no page referral
    Given I visit the Research and Events Landing Page
    Then The Back link in the Breadcrumb is not present

  @ARROW_1062 @full @smoke @desktop
  Scenario: The Breadcrumb contains a Back Link to the previous page
    Given I have searched the Arrow site for a Part with Price Tiers
    When I click on the Title of the Search Item
    Then The Back link in the Breadcrumb is present


  @ARROW_1062 @full @smoke @desktop
  Scenario: The Home page should NOT have a Breadcrumb
    Given I visit the Arrow Home Page
    Then I should NOT see a Breadcrumb

  @ARROW_1062 @full @smoke  @cms_dependent @desktop
  Scenario: The last breadcrumb is not Linkable
    Given I visit a News Article on the Arrow site
    And I can see the Breadcrumbs
    Then The Last Breadcrumb item should not be a link

  @ARROW_1062 @full @cms_dependent @desktop
  Scenario: News Articles have their Title in the Breadcrumb
    Given I visit a News Article on the Arrow site
    And I can see the Breadcrumbs
    Then The Breadcrumb for the Article should end with the Article Title

  @ARROW_1063 @full @api_dependent
  Scenario: Products Details have their SKU and Manufacturer in the Breadcrumb
    Given I visit a Part Detail with Multiple Cart Options
    And I can see the Breadcrumbs
    Then The Breadcrumb for the Product Detail ends with the SKU and Manufacturer Name

  @ARROW_1064 @full @api_dependent
  Scenario: Datasheets Details have their related Products in the Breadcrumb
    Given I visit the Datasheets Detail page
    And I can see the Breadcrumbs
    Then The Breadcrumb for the Datasheets Detail ends with Datasheet Title

  @ARROW_1062 @full @cms_dependent @ARROW_1776
  Scenario Outline: Page breadcrumbs conform to the desired format
    Given I visit the url "<page>"
    And I can see the Breadcrumbs
    Then The Breadcrumb should be <breadcrumb>
    And Each Breadcrumb Item link should start with the Base Url

    Examples:
      | page                               | breadcrumb                                    |
      | products                           | Home / Products                               |
      | datasheets                         | Home / Datasheets                             |
      | reference-designs                  | Home / Reference Designs                      |
      | research-and-events                | Home / Research and Events                    |
      | products/amplifiers                | Home / Products / Amplifiers                  |
      | products/amplifiers/catv-amplifier | Home / Products / Amplifiers / CATV Amplifier |
      | support/help-center/faqs           | Home / Support / Help Center / FAQs           |
      | sitemap                            | Home / Sitemap                                |

  @full @ARROW_1276
  Scenario: Customer can see current project in breadcrumb
    Given I log in as an Arrow customer
    And I visit the Design Centre Landing Page
    And I delete all projects
    And I create a New Project 'Breadcrumb-1276' on the My Projects page
    Then I can see that the current project is shown in the breadcrumb
