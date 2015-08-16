Feature: JSON processing

  jr is jq like JSON processor for Rubyist

  Scenario: Filter single JSON of Object
    Given a file named "input.json" with:
    """
    {"foo":"bar"}
    """
    When I run `jr 'self' input.json`
    Then the output should contain exactly:
    """
    {
      "foo": "bar"
    }

    """

  Scenario: Filter multiple JSONs of Object
    Given a file named "input.json" with:
    """
    {"foo":"bar"}
    {"baz":"foobar"}
    {"qux":"quux"}
    """
    When I run `jr 'self' input.json`
    Then the output should contain exactly:
    """
    {
      "foo": "bar"
    }
    {
      "baz": "foobar"
    }
    {
      "qux": "quux"
    }

    """

  Scenario: Filter JSON using Ruby methods
    Given a file named "input.json" with:
    """
    {"id":1,"name":"foo"}
    {"id":2,"name":"bar"}
    {"id":3,"name":"baz"}
    {"id":4,"name":"foobar"}
    {"id":5,"name":"qux"}
    """
    When I run `jr 'select{|j| j[:id].odd? }.map{|j| {name: j[:name]} }' input.json`
    Then the output should contain exactly:
    """
    {
      "name": "foo"
    }
    {
      "name": "baz"
    }
    {
      "name": "qux"
    }

    """

  Scenario: Read multiple files
    Given a file named "input1.json" with:
    """
    {"foo":"bar"}
    """
    And a file named "input2.json" with:
    """
    {"baz":"foobar"}
    """
    When I run `jr 'self' input1.json input2.json`
    Then the output should contain exactly:
    """
    {
      "foo": "bar"
    }
    {
      "baz": "foobar"
    }

    """

  Scenario: Filter single JSON of Array
    Given a file named "input.json" with:
    """
    [1,2,3]
    """
    When I run `jr 'self' input.json`
    Then the output should contain exactly:
    """
    [
      1,
      2,
      3
    ]

    """

  Scenario: Filter multiple JSONs of Array
    Given a file named "input.json" with:
    """
    [1,2,3]
    [4,5,6]
    [7,8,9]
    """
    When I run `jr 'self' input.json`
    Then the output should contain exactly:
    """
    [
      1,
      2,
      3
    ]
    [
      4,
      5,
      6
    ]
    [
      7,
      8,
      9
    ]

    """

  Scenario: Filter a string
    Given a file named "input.json" with:
    """
    "foo"
    """
    When I run `jr 'self' input.json`
    Then the output should contain exactly:
    """
    "foo"

    """

  Scenario: Filter multiple strings
    Given a file named "input.json" with:
    """
    "foo"
    "bar"
    "baz"
    """
    When I run `jr 'self' input.json`
    Then the output should contain exactly:
    """
    "foo"
    "bar"
    "baz"

    """

  Scenario: require rubygems using -r option
    Given a file named "input.json" with:
    """
    {"ua":"Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"}
    """
    When I run `jr -r woothee 'map{ |j| j.merge({woothee: Woothee.parse(j.ua)}) }' input.json`
    Then the output should contain exactly:
    """
    {
      "ua": "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)",
      "woothee": {
        "name": "Googlebot",
        "category": "crawler",
        "os": "UNKNOWN",
        "os_version": "UNKNOWN",
        "version": "UNKNOWN",
        "vendor": "UNKNOWN"
      }
    }

    """

  Scenario: Output each JSON in single line using --compact-output option
    Given a file named "input.json" with:
    """
    {
      "name": "foo"
    }
    {
      "name": "bar"
    }
    {
      "name": "baz"
    }

    """
    When I run `jr --compact-output 'self' input.json`
    Then the output should contain exactly:
    """
    {"name":"foo"}
    {"name":"bar"}
    {"name":"baz"}

    """

  Scenario: Output each JSON in single line using -c option
    Given a file named "input.json" with:
    """
    {
      "name": "foo"
    }
    {
      "name": "bar"
    }
    {
      "name": "baz"
    }

    """
    When I run `jr -c 'self' input.json`
    Then the output should contain exactly:
    """
    {"name":"foo"}
    {"name":"bar"}
    {"name":"baz"}

    """
