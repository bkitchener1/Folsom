@ARW-3601
@desktop
@mobile @tablet
@full_cart
Feature: As an arrow.com user, if I selected a freight forwarder shipping address I also see the ultimate consignee address for the order when viewing my order detail

  Scenario: Display ultimate consignee address in Shipping Address section of Order Detail page
    Given I visit the arrow login page
    And I login to arrow.com
    When I have submitted an order with ultimate consignee address for order detail
