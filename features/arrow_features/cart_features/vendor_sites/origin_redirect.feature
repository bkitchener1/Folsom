@ARW-388
@desktop @mobile @tablet
@full_cart

  Feature: Vendor site redirect when all items are removed from cart

    Scenario: When adding an item from an Vendor site and then deleting all items from the cart should redirect the user back to the vendor site
      Given I Enable the Feature Flag 'QuarantineCart'
      And I visit the arrow website
      And I add "3000" items with part number "1340091S9715673N7769"
      When I add an item through a vendor site
      And I delete the item
      Then I should be redirected back to the original vendor site










    