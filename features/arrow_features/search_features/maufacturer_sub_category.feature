@ARW-829
@desktop @tablet @mobile
  @full

  Feature: Manufacturer sub-category links to a search page with manufacturer and sub-category as param

    Scenario: When a Manufacturer and sub-category are selected the user should be taken to a url with those params set
      Given I am on the manufacturer fairchild-semiconductor page
      And I click on the "Optoelectronics" product category
      When I click on the "PhotoCouplers" sub-category heading
      Then I should be on the correct URL filtered with "Fairchild+Semiconductor" as the Manufacturer and "Optoelectronics-sep-PhotoCouplers" as the sub-category
      And The category filter should show "Optoelectronics" and the Manufacturer filter "Fairchild Semiconductor"




