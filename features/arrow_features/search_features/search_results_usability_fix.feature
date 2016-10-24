Feature: Search results usability

  @ARW_775 @full @smoke @desktop
  Scenario: Customer views search results with alternating contrasting rows
    When I search for a wide range of products
    Then I can see that the results are displayed with alternating contrast

  @ARW_775 @full @smoke @desktop
  Scenario: Customer can access all filtering options using scrollbars
    When I search for a wide range of products
    Then I can see a scrollbar in a search filter


