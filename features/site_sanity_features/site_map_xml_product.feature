
@desktop @full @sanity @qa_only

Feature: Sitemap XML product map Check

  Scenario: Check Sitemap product page for errors
    Then the Sitemap product page should load without exceptions

  Scenario: Check Sitemap page for search results
    Then the Sitemap search page should load with links to pages


