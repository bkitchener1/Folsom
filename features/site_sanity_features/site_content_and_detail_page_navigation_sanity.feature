@sanity @desktop @full
Feature: SiteContentDetailPageNavigationSanity
  As s User
  I can see Arrow Content and Detail Pages without exception

  Scenario: Customer views login page
    Given I visit the "LoginPage"
    Then The Page Loads without any exceptions

  Scenario: Customer views news article
    Given I visit the "NewsArticlePage"
    Then The Page Loads without any exceptions

  Scenario: Customer views video article
    Given I visit the "VideoArticlePage"
    Then The Page Loads without any exceptions

  Scenario: Customer views Event Detail Page
    Given I visit the "EventDetailPage"
    Then The Page Loads without any exceptions

  Scenario: Customer views Manufacturer's Detail Page
    Given I visit the ManufacturersDetailPage
    Then The Page Loads without any exceptions

  Scenario: Customer views FAQ Page
    Given I visit the "FaqPage"
    Then The Page Loads without any exceptions

  Scenario: Customer views Reference Design Detail Page
    Given I visit the Reference Design Detail Page
    Then The Page Loads without any exceptions

  Scenario: Customer views Webinar Detail Page
    Given I visit the "WebinarDetailPage"
    Then The Page Loads without any exceptions

  Scenario: Customer views Contact Us Page
    Given I visit the "ContactUsPage"
    Then The Page Loads without any exceptions


  Scenario: Customer views Part Detail with Multiple Cart Options
    Given I visit a Part Detail with Multiple Cart Options
    Then The Page Loads without any exceptions


  Scenario: Customer views Datasheets Detail page
    Given I visit the DatasheetsDetailPage
    Then The Page Loads without any exceptions


  Scenario: Customer views Sitemap Page
    Given I visit the "SitemapPage"
    Then The Page Loads without any exceptions


  Scenario: Customer views Product Category Sitemap Page
    Given I visit the ProductCategorySitemapPage
    Then The Page Loads without any exceptions
