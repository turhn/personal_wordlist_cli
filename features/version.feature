Feature: Display proper version information
  Scenario: Get version
    When I run `pwlcli -v`
    Then the output should contain:
      """
      0.0.1
      """
