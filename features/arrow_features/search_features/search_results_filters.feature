Feature: SearchResultsFilters

  @desktop
  @ARROW_1636 @full @smoke
  Scenario: Users can Filter Content Search results by Content Type
    Given I have searched the Arrow site for Research and Events "a"
    Then I can see a "contentType" Filter Group
    And I can see a Checkbox Search Filter with value "Videos"

  @desktop
  @full @smoke @BKT_542
  Scenario: Administrator disables option to narrow search to Arrow products
    When I search the Arrow site for Product "BAE"
    Then I cannot see a "fstockedat" Filter Group
    And  I can see a Datasheets Toggle on the Product Listings Page

  @desktop
  @ARROW_1636 @full @smoke
  Scenario: Users can Filter Content Search results by Publication Date
    Given I have searched the Arrow site for Research and Events "test"
    Then I can see a "publicationPeriod" Filter Group
    And The Filter Group has Radio Checkboxes

  @desktop
  @ARROW_1352 @full @smoke
  Scenario: Users can see 4 Filter Sections when Searching for Reference Designs
    Given I have searched the Arrow site for Reference Design "test"
    Then I can see "4" Filter Sections on the Search Results Page

  @desktop
  @ARROW_625 @full @smoke
  Scenario: Users can see appropriate Filters when they Apply a Filter
    Given I have searched the Arrow site for a Product
    Given I can see the Default Filter Groups
    When I click on the "1" Search Filter Link
    Then I am directed to the Products Search Results Page
    Then I can see the Filter Groups have changed

  @desktop
  @BKT_404 @full
  Scenario: Customer can quickly step back up to product list after selecting category
    When I search the Arrow site for Product "Magnachip"
    And I filter by category
    Then I can link back to all categories

  @desktop
  @BKT_404 @full @smoke
  Scenario: Customer can quickly step back up to product list after selecting subcategory
    When I search the Arrow site for Product "Magnachip"
    And I filter by subcategory
    Then I can link back to the supercategory

  @mobile
  @ARROW_1570 @full @smoke
  Scenario: Mobile Users CANNOT see Search Filters by default
    And I have searched the Arrow site for Product "bav"
    Then The Search Filters visibility is "false"

  @mobile
  @ARROW_1570 @full @smoke
  Scenario: Mobile Users can see Search Filters by pressing the Filters Button
    And I have searched the Arrow site for Product "bav"
    When I click on the Search Filters Button
    Then The mobile Search Filters are visible

    @tablet
  @ARROW_1570 @full @smoke
  Scenario: Mobile Users can close the Search Filters by pressing the X
    And I have searched the Arrow site for Product "bav"
    And I click on the Search Filters Button
    When I click on the X to close the Search Filters
    Then The Search Filters visibility is "false"

  @mobile
  @ARROW_2292 @full @smoke
  Scenario: Mobile Users can close the Search Filters by pressing Cancel
    And I have searched the Arrow site for Product "bav"
    And I click on the Search Filters Button
    Then I CANNOT see the X to close the Search Filters
    When I click on the Cancel Button in the Search Filters
    Then The Search Filters visibility is "false"

    @desktop
  @ARROW_1134 @full @smoke
  Scenario: User can filter Product Search Results by Manufacturer Name using radio filter option
    Given I Search for Product Category 'Batteries'
    Then I can see Radio Filter options
    When I select the Radio Filter for Manufacturer 'Autec Power Systems'
    Then I can see the Search Result filter by this Manufacturer

  @desktop
  @ARROW_1131 @BKT_630 @full
  Scenario: User can filter Product Search Results by Manufacturer Name using checkbox filter option
    Given I have searched the Arrow site for Product "bav"
    When I select the checkbox Filter for Manufacturer 'Vishay'
    Then I can see the Search Result filter by this Manufacturer

  @ARROW_1732 @full @skip
  Scenario: User CANNOT see 'See more' link for less than 10 Filter options
    Given I have searched the Arrow site for Product "Batteries"
    Then I CANNOT see 'See More' Link for 'eurohs' filter options

  @desktop
  @ARROW_811 @BKT-681 @full @smoke
  Scenario: Users can Toggle Products Search to View by Datasheets
    Given I have searched the Arrow site for Product "BA"
    Then I can see a Datasheets Toggle on the Product Listings Page
    When I click on the "Datsheets" Toggle
    Then I can see the Datasheet Listings

  @ARROW_1730 @full
  Scenario: Users can see Units of measure in the Search Filter options
    Given I Search for Product Category 'Batteries'
    Then Each label in filter container "Charge Current" contains "mA"

  @ARROW_1808 @full
  Scenario: Users can see the Unit of Measure in the Filter Group Name for Slide Filters
    Given I Search for Product Category 'Batteries'
    Then Each label in filter container "Capacity" contains "(AH)"
