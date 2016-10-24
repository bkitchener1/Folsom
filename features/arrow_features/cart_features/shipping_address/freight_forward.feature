@ARW-3890 @ARW-3893
@desktop
# @mobile @tablet

@full_cart @cart_smoke @smoke_cart


Feature:  Freight forward address type

#  This feature adds a new address as a freight forward
#  It then will verify the "Ultimate Destination" text in the header once selected
#  It will also verify the international trade compliance message

# added new field

  Scenario: User can add a new freight forward address
    Given I visit the shipping address page
      # Logic is taking user to homepage after login instead of previous page. Adding corrective steps
    Then I visit the cart summary page
    And I click the checkout button

    When I click the add new address link
    And I select address type for other options in drop down "2"
    And I enter "Freight Forward" into field "name"
    And I enter "Arrow" into field "company"
    And I enter "3033122135" into field "phone"
    And I select "United States of America" as the country
    And I enter "123 S Freight" into field "address"
    And I enter "Denver" into field "city"
    And I enter "80113" into field "zip"
    And I enter "b.kitchener@aspenware.com" into field "email"
    And I click update
    And I select existing address "123 S Freight"
    Then I should see the Ultimate Destination section
    And I should see the international trade compliance message
    Then I click the checkout button
