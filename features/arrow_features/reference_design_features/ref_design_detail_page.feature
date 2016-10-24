
Feature: ReferenceDesignDetailPageFeature

  @ARROW_1036 @full @desktop
  Scenario: User Can see a Page Title on the Reference Design Detail page
    Given  I visit a Reference Design Detail Page
    Then The Reference Detail Page has a Title
    And The Reference Detail Page has a Sub-Title
    And The Browser Page Title is correct for the Reference Design Detail Page

  @ARROW_1043 @full
  Scenario: User Can see a Key Features section on the Reference Design Detail page
    Given  I visit a Reference Design Detail Page
    Then The Reference Detail Page has a Key Features section
    And The Key Features shows at least 1 Feature

  @ARROW_1044 @full
  Scenario: User Can see a Description section on the Reference Design Detail page
    Given  I visit a Reference Design Detail Page
    Then The Reference Detail Page has a Description section

  @ARROW_1038 @full
  Scenario: User Can see an enlarged Main Image on the Reference Design Detail page
    Given  I visit a Reference Design Detail Page
    When I click to the Enlarge Image on the Reference Design Detail page
    Then I can see an enlarged version of the main image

  @ARROW_1037 @full
  Scenario Outline: User can see Image Component on Reference Design Detail page on Mobile and Tablet
    Given I am in "<size>" size
    And I visit a Reference Design Detail Page with 5 related module
    Then I can see the first image
    And I can see the counter for image gallery
    And I cant see Image gallery grid
    And I cant see the image galley
    Examples:
      | size    |
      | mob     |
      | phab    |
      | tab     |

  @ARROW_1038 @full
  Scenario Outline: User can see Manufacturer Component on Reference Design Detail page on Mobile
    Given I am in "<size>" size
    And I visit a Reference Design Detail Page with no associated documents
    Then I can see the manufacturer component
    And I can see the manufacturer name
    And I can see the manufacturer application category
    And I can see the manufacturer product type
    And I can see following icons
      | icons                |
      | download             |
      | add to my favourites |
    And I can see the Buy button
    And I can't see Design with Envision button
    Examples:
      | size    |
      | mob     |
      | phab    |

  @ARROW_1039 @full @smoke @tablet @desktop @max
  Scenario: User viewing Reference Design Detail page with Associated Documents on Desktop and Tablet
    Given I visit the Reference Design Detail Page
    Then I can see the Associated documents heading
    And I can see the associated documents items
    And I can see the download link for the associated documents item


  @ARROW_1039 @full @smoke @mobile @phablet
  Scenario: User viewing Reference Design Detail page with Associated Documents on Mobile device
    Given I visit the Reference Design Detail Page
    And I can see the associated documents items
    And I can see the download link for the associated documents item


  @ARROW_1039 @full
  Scenario Outline: User viewing Reference Design Detail page with no Associated Documents on Desktop and Tablet
    Given I am in "<size>" size
    And I visit a Reference Design Detail Page with no associated documents
    And I CANNOT see the Associated documents heading
    Examples:
      | size    |
      | tab     |
      | desktop |
      | max     |

  @ARROW_1039 @ARROW_1040 @full
  Scenario Outline: User viewing Reference Design Detail page with no Associated Documents on Mobile device
    Given I am in "<size>" size
    And I visit a Reference Design Detail Page with no associated documents
    Then I CANNOT see the Associated documents Tab
    Examples:
      | size    |
      | mob     |
      | phab    |

  @ARROW_1040 @full @smoke @tablet @desktop @max
  Scenario: User viewing Reference Design Detail page with End Products on Desktop and Tablet
    Given I visit the Reference Design Detail Page
    Then I can see the End Products heading
    And I can see the End Products items

  @ARROW_1040 @full @smoke @mobile @phablet
  Scenario: User viewing Reference Design Detail page with End Products relationship on Mobile device
    Given I visit the Reference Design Detail Page
    Then I can see End Products heading in tabbed view
    And I can see the End Products items

  @ARROW_1047 @full
  Scenario Outline: User can see Related Research and Event module on Reference Design Detail page on ALL devices
    Given I am in "<size>" size
    And I visit a Reference Design Detail Page with 5 related module
    And I find the Masonry Section
    And I can see at least 1 Masonry Item
    Examples:
      | size    |
      | mob     |
      | phab    |
      | tab     |
      | desktop |

  @ARROW_1045 @full
  Scenario: User can see Featured parts on Reference Design Detail Page
    Given I visit a Reference Design Detail Page with 5 related module
    Then I can see Featured Parts heading
    And I can see Featured Parts Image
    And I can see Featured Parts Name
    And I can see Featured Parts Manufacturer
    And I can see Featured Parts Type
    And I can see Featured Parts Description
    And I can see Featured Parts CTA Button








