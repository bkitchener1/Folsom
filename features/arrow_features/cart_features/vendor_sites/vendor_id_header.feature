@COP-172
@desktop @mobile @tablet
@full_cart

  Feature: Vendor ID should show in the cart header
    Scenario: Vendor ID in Cart Header on Cart summary, Log In, and Register
      Given I Enable the Feature Flag 'QuarantineCart'
      And I visit the arrow website
      And I add "3000" items with part number "1340091S9715673N7769"
      When I add an item through a vendor site
      Then The vendor ID should appear in the header
      When I click the checkout button
      Then The vendor ID should appear in the header
      When I click on the create account link
      Then The vendor ID should appear in the header














    