# hash-dot

Reference hash keys by dot just like in EcmaScript!

For example:

```bash
irb(main):001:0> require 'hash-dot'
=> true
irb(main):002:0> hash = {one: 'two', three: 'four'}
=> {:one=>"two", :three=>"four"}
irb(main):003:0> hash.one
=> "two"
irb(main):004:0> hash[:one]
=> "two"
irb(main):005:0> hash.five = 'six'
=> "six"
irb(main):006:0> hash
=> {:one=>"two", :three=>"four", :five=>"six"}
irb(main):007:0>
```

## Installation

```bash
gem install 'hash-dot'
```

Or add to your `Gemfile`

```ruby
gem 'hash-dot'
```

Add:

```ruby
require 'hash-dot'
```

To your ruby files

## Note on performance

Performance with this gem is abysmal!  Don't use this in apps where performance matters.
