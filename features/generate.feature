Feature: Generate wordlists

  Scenario: Use stdout
    When I run `pwlcli generate ../../fixtures/Patternfile -d ../../fixtures/sample_data.json`
    Then the output should contain:
    """
    joh0D
    joh1D
    joh2D
    joh3D
    joh4D
    joh5D
    """

  Scenario: Use output file
    When I run `pwlcli generate ../../fixtures/Patternfile -d ../../fixtures/sample_data.json -o sample.txt`
    Then the file "sample.txt" should exist
    When I run `cat sample.txt`
    Then the stdout should contain:
    """
    joh0D
    joh1D
    joh2D
    joh3D
    joh4D
    joh5D
    """

