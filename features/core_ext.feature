Feature: core_ext

  jr introduce some extended method for basic objects

  Scenario: attribute reader
    Given a file named "input.json" with:
    """
    {"name":"foo"}
    {"name":"bar"}
    {"name":"baz"}
    """
    When I run `jr 'map(&:name)' input.json`
    Then the output should contain exactly:
    """
    "foo"
    "bar"
    "baz"

    """

  Scenario: attribute checker
    Given a file named "input.json" with:
    """
    {"ua":"Chrome"}
    {"ua":"Safari","is_crawler":false}
    {"ua":"Googlebot","is_crawler":true}
    """
    When I run `jr 'select(&:is_crawler?)' input.json`
    Then the output should contain exactly:
    """
    {
      "ua": "Googlebot",
      "is_crawler": true
    }

  """

  Scenario: unwrap Array and Hash
    Given a file named "input.json" with:
    """
    ["a","b",["c"]]
    {"a":"A","b":"B","c":{"cc":"CC"}}
    """
    When I run `jr 'unwrap' input.json`
    Then the output should contain exactly:
    """
    "a"
    "b"
    [
      "c"
    ]
    "A"
    "B"
    {
      "cc": "CC"
    }

    """

  Scenario: number of JSON
    Given a file named "input.json" with:
    """
    {"name":"foo"}
    {"name":"bar"}
    {"name":"baz"}
    """
    When I run `jr 'size' input.json`
    Then the output should contain exactly:
    """
    3

    """
