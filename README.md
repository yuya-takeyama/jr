# jr: command-line JSON processor for Rubyists

jr is [jq](http://stedolan.github.io/jq/) like JSON processor.  
Its script can be written not a specific language but Ruby!

![jr in action](./resources/img/jr.gif)

## Installation

Add this line to your application's Gemfile:

    gem 'jr-cli'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jr-cli

## Usage

jr filter can be written in Ruby!

```
$ jr <jr filter> [file...]
```

You can also read JSON not from files but from STDIN.

## jr filter tutorial

Let's process JSON of GitHub API!

At first, download JSON of repos into your local to avoid API rate limit.

```
$ curl -s 'https://api.github.com/users/yuya-takeyama/repos' > repos.json
```

### show repositories

Because response from `GET /users/:username/repos` is wrapped with `Array`, select the first element.  
You'll get stream of JSON reperesents repositories.

```
$ jr 'first' repos.json
```

### map to reduce data

Default response has too much informations.  
So reduce data using `#map` method.

```
$ ./bin/jr 'first.map{|j| {name: j[:name], desc: j[:description], lang: j[:language]} }' repos.json
{
  "name": "acne",
  "desc": "Simple DI container for PHP < 5.3",
  "lang": "PHP"
}
{
  "name": "akb48_recognizer",
  "desc": "AKB48 recognition using Face.com API",
  "lang": "Ruby"
}
(...omitted...)
{
  "name": "disco-dance.tv",
  "desc": "For Socket.IO learning.",
  "lang": "JavaScript"
}
{
  "name": "docker-plenv-vanilla",
  "desc": null,
  "lang": "Shell"
}
```

### aggregate by language

Repositories have its primary language which is detected automatically.  
Let's aggregate it and count by languages.

```
$ ./bin/jr 'first.map{|j| {name: j[:name], desc: j[:description], lang: j[:language]} }.reduce({}){|acc, j| l = j[:lang]; acc[l] ||= 0; acc[l] += 1; acc }' repos.json
{
  "PHP": 10,
  "Ruby": 12,
  "": 1,
  "JavaScript": 3,
  "CoffeeScript": 1,
  "CSS": 1,
  "Go": 1,
  "Shell": 1
}
```

## Basic mechanism

It's helpful to know jr's basic mechanism.  
Shortly, jr is implemented like below.

```ruby
json_enumerator.instance_eval { your_jr_filter_runs_here }
# And print its result
```

## Contributing

1. Fork it ( https://github.com/yuya-takeyama/jr/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
