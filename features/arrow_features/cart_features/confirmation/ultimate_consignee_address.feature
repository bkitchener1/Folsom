@ARW-3600
@desktop
@mobile @tablet

@full_cart @cart_smoke

Feature: As an arrow.com user, if I selected a freight forwarder shipping address I also see the ultimate consignee address for the order when viewing my order confirmation.

  Scenario: Display ultimate consignee address in Shipping Address section of Confirmation page
    Given I visit the arrow login page
    And I login to arrow.com
    And I have an item in my cart
    And I visit the cart summary page
    And I check out
    And I click the add new address link
    And I select address type "1" for Freight forwarder
    And I enter "ult User" into field "name"
    And I enter "Arrow" into field "company"
    And I enter "3038901234" into field "phone"
    And I select "United States of America" as the country
    And I enter "111 arrow st" into field "address"
    And I enter "Denver" into field "city"
    And I enter "80112" into field "zip"
    And I enter "automation_user@gmail.com" into field "email"
    And I click update
    And I select freight forwarder shipping address
    And I click the checkout button
    And I select the shipping method
    And I click the checkout button
    And I enter a test "visa" card
    And I select the default address
    And I click the checkout button
    And I place my order
    And I should be on the order confirmation page'
    Then the order confirmation address should display freight forwarder address

