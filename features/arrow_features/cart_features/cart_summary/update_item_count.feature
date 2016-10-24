Feature: Cart summary update item count
#
  @TEL-1907 @TEL-1908
  @mobile @tablet @desktop
    @full_cart @cart_smoke
  Scenario: As an Arrow.com user, I want to be able to update the number of items in my cart
    Given I visit the arrow website
    And I have an item in my cart
    And I visit the cart summary page
    Then the first item should match the first item in the api
    And I update the first item quantity to "31"
    And I visit the cart summary page
    Then The first item should display count "31"
    And the first item should match the first item in the api



