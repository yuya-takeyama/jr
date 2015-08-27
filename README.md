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
$ jr [options] <jr filter> [file...]
```

You can also read JSON not from files but from STDIN.

### options

```
        --require FILE               require the FILE before execution
    -c, --compact-output             output each JSON in single line
    -f, --from-file FILE             read filter from file
    -r, --raw-output                 output strings as raw output
    -R, --raw-input                  read each line as string
    -C, --color-output               output with colors even if writing to a pipe or a file
    -M, --monochrome-output          output without colors
    -n, --null-input                 use null as input instead of any files
```

## jr filter tutorial

Let's process JSON of GitHub API!

At first, download JSON of repos into your local to avoid API rate limit.

```
$ curl -s 'https://api.github.com/users/yuya-takeyama/repos?per_page=100' > repos.json
```

### Unwrap Array with `Enumerable#unwrap`

Because response from `GET /users/:username/repos` is wrapped with `Array`, unwrap it using `Enumerable#unwrap`.  
It's a built-in method of jr.  
You'll get stream of JSON reperesents repositories.

```
$ jr 'unwrap' repos.json
```

### Aggregate data with methods of `Enumerable`

`Enumerable` has many useful methods and you can transform data with them.

```
$ jr 'unwrap.group_by(&:language).map{|k, v| [k, v.size] }.sort_by{|k, v| -v }' repos.json
[
  "Ruby",
  28
]
[
  "PHP",
  22
]
[
  "Go",
  17
]
(...omitted...)
[
  "VimL",
  1
]
[
  "CoffeeScript",
  1
]
[
  "Perl",
  1
]
```

### Output as text

You can transform JSONs into String and output as raw text using `-r` option.

```
$ jr 'unwrap.group_by(&:language).map{|k, v| [k, v.size] }.sort_by{|k, v| -v }.map{|l, s| "#{s}\t#{l}" }' -r repos.json
28      Ruby
22      PHP
17      Go
12      JavaScript
11
3       CSS
2       Shell
2       C
1       VimL
1       CoffeeScript
1       Perl
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
