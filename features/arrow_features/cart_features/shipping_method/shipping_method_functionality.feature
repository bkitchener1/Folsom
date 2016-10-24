@COP-30 @COP-31 @COP-32
@desktop @mobile @tablet
  @full_cart

  Feature: Shipping Method products by ship location

    Scenario: Shipping method page displays correctly with US product and user should get an error if they continue without a method selected
      Given I visit the shipping method page
      Then I should see a tab showing me "US ORIGIN"
      And "1 item ships from US Origin" line with a hide/show all option should be seen
      And The US item should show ships from "Ships from: US" at the item level
      And The US item should show a Est. Ship date
      And The US item should show a Est. Delivery date
      And Use Own Shipping account option should be shown
      And The US shipping method should default to "Please select a shipping method"
      When I click the continue checkout button
      Then A error should appear stating "Please select a shipping method"

    Scenario: If user US buyer selects the use my own shipping method all prices should clear from the shipping methods
      Given I visit the shipping method page
      When I select the use my own US shipping method
      And A field for me to enter my account number should appear
      And All US prices should be removed from the shipping methods
      When I click the continue checkout button
      Then A error should appear stating "You must enter your account number if you wish to use your own shipping account."

    Scenario: Shipping method page displaying correctly with a Non-US product and clicking use my own shipping method should remove all shipping prices
      Given I visit the shipping method page with a non-US product
      Then I should see a tab showing me "NON-US ORIGIN"
      And "1 item ships from Non-US Origin Netherlands" line with a hide/show all option should be seen
      And Use Own Shipping account option should be shown
      And The non-US item should show ships from "Ships from: NL" at the item level
      And The non-US item should show a Est. Ship date
      And The non-US item should show a Est. Delivery date
      And The non-US shipping method should default to "Please select a shipping method"
      When I select the use my own non-US shipping method
      Then All non-US prices should be removed from the shipping methods








