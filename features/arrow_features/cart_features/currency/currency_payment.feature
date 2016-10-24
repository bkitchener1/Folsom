@COP-146
@desktop @tablet @mobile
  @full_cart

    Feature: Accepted payment types based on currency selected

      Scenario Outline:
        Given I visit the payment page as the second user
        When I switch the currency to <currency>
        Then The available payment method and icons should changed depending on <currency>

        Examples: Currency
       | currency |
       |   USD    |
       |   AUD    |
       |   BRL    |
       |   GBP    |
       |   MYR    |
       |   TWD    |