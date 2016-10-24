@api_dependent
@desktop
Feature: SearchResultsLoadMore
    # load more button was removed
    # and default count is 25
    # there is no longer a Load More link
   # there is a dropdown to select 10, 25, 50, or 100 now

  @ARROW_287 @BKT_359 @full @smoke
  Scenario: User wants to see more Product results when they click on the 'Load more' Button
    Given I have searched the Arrow site for Product "fa"
    Then "25" result items are displayed
     # When I click on Load More
    When I select "50" in the drop down
    Then "50" result items are displayed

  # updated to 20, 40 from 25, 50 per the change

  @ARROW_1345 @full @smoke @BKT_1104
  Scenario: User wants to see more Reference Design results when they click on the 'Load more' Button
    Given I have searched the Arrow site for Reference Design "test"
      #Then "25" result items are displayed
    Then "20" result items are displayed
    When I click on Load More
    Then "40" result items are displayed

   # updated for the new 2000 results message

  @ARROW_287 @full @smoke
  Scenario: User wants to be be prompted to do a more refined search at 400 results
    Given I visit page "80" of the Arrow site Search results for "fa"
    Then I am prompted to Refine My Search
    And It displays with a helpful message

      # updated with page drop down

  @ARROW_287 @BKT_359 @full @smoke @BKT_1104
  Scenario: User wants to see the Load More button and Back to Top link after "50" results
    Given I have searched the Arrow site for Product "fa"
    #Then "50" result items are displayed
    Then "25" result items are displayed
    When I scroll to the bottom of the Page
    #Then I will see the Load More Button
      #Then I will see the Load More
    When I select "10" in the drop down
    And I can see the Back to Top link

  # update as load more button is removed

  @ARROW_287 @full @smoke
  Scenario: Load More does NOT display when there are less than 20 results
    Given I have searched the Arrow site for Product "ab2.8x4.5dy"
    Then There are less than 20 results
    #And I will NOT see the Load More Button
    And I will NOT see the paging

     # invalid test below perhaps as load more is obsolete

  @ARROW_600 @WIP
  Scenario: Load More should not display when i have reached the end of my results (which are less than 400)
    Given I visit page "3" of the Arrow site Search results for "bav99"
      #Then I will NOT see the Load More Button
    And I will NOT see the paging