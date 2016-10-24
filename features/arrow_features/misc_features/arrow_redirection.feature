@desktop
Feature: ArrowRedirection

  @ARROW_3107 @smoke @full
  Scenario Outline: Requesting a legacy reference Design url should re-direct to the new Arrow.com site
    Given I visit the url "<old_url>"
    Then I am re-directed to "<re_dir_url>"

    Examples:
      | old_url                                                  | re_dir_url                                                                                     |
      | /reference-designs/blah/D044980997996E2F97B6D8D8CE9E8F5E | /reference-designs/lt1568-low-noise-4th-order-bandpass-filter/D044980997996E2F97B6D8D8CE9E8F5E |

