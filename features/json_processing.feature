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
		When I run `jr 'select{|j| j[:id].odd? }.map{|j| {name_with_id: j[:name] + " (#{j[:id]})"} }' input.json`
		Then the output should contain exactly:
		"""
		{
		  "name_with_id": "foo (1)"
		}
		{
		  "name_with_id": "baz (3)"
		}
		{
		  "name_with_id": "qux (5)"
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
