Feature: Initialize

  Scenario: Use stdout
    When I run `pwlcli init`
    Then the file "Patternfile" should exist
    When I run `cat Patternfile`
    Then the stdout should contain:
    """
    # This is a Patternfile for PersonalWordListCLI
    # This is Ruby DSL so you can use Ruby syntax to create patterns.

    #sequence(0..999) do |n|
    #  partial { first_name[0..2].downcase }
    #  partial { n.to_s }
    #  partial { last_name[0] }
    #end

    #sequence(0..999) do |n|
    #  partial { first_name[0..2].downcase }
    #  partial { n.to_s }
    #  partial { last_name[0] }
    #end
    """

