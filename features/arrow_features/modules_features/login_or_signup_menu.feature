Feature: LoginSignUpMenu

  @BKT_434 @BKT_551 @full @smoke @phablet @tablet @desktop
  Scenario: Non Mobile Users Can see a My Arrow and Login or SignUp Link
    Given I visit the Arrow Home Page
    Then I can see the MyArrow Link
    Then I can see the Login or Sign Up Link

  @BKT_434 @smoke @desktop
  Scenario: Logged in User's can see they are Logged In
    Given I visit the Arrow Home Page
    When I have logged in as an Arrow customer
    Then I can see that I am Logged In