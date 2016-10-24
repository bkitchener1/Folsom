@COP-146
@desktop @tablet @mobile
  @full_cart

    Feature: When language and currency types are selected the prices should display in the proper format (Shipping Address)

      Scenario Outline: Testing currency and language combos in Shipping Address Page
        Given I visit the shipping address page
        When I switch language to <language>
        And I switch the currency to <currency>
        Then The order summary should show the costs in the correct format combination for <format>

        Examples: Combinations
        | language | currency | format  |
        | english  |   USD    | eng-usd |
        | german   |   EUR    | de-eur  |
        | chinese  |   HKD    | cn-hkd  |