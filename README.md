# mruby-tbot   [![Build Status](https://travis-ci.org/nsheremet/mruby-tbot.svg?branch=master)](https://travis-ci.org/nsheremet/mruby-tbot)
gem class
## install by mrbgems
- add conf.gem line to `build_config.rb`

```ruby
MRuby::Build.new do |conf|

    # ... (snip) ...

    conf.gem :github => 'nsheremet/mruby-tbot'
end
```
## example
```ruby
p gem.hi
#=> "hi!!"
t = gem.new "hello"
p t.hello
#=> "hello"
p t.bye
#=> "hello bye"
```

## License
under the MIT License:
- see LICENSE file
