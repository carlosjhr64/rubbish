# rubbish

* [VERSION 1.1.221208](https://github.com/carlosjhr64/rubbish/releases)
* [github](https://www.github.com/carlosjhr64/rubbish)
* [rubygems](https://rubygems.org/gems/rubbish)

## Deprecation notice:

This is my last `Rubbish` update.
I've merged this project with [Helpema](https://www.github.com/carlosjhr64/helpema).

## DESCRIPTION:

A ruby-ish way to go to the shell.

Bash and Fish aware.

## SYNOPSIS:

Although it's easy enough to access the system's default shell from ruby,
you may want to run a specific shell like fish for it's unique features:
```ruby
require 'rubbish'

# Fish features the double splat...
# reads output and returns it:
Rubbish.fish('ls lib/**.rb').split #=> ["lib/rubbish.rb"]
# The '?' method return weather or not the command succeeded.
# Fish's true and false commands:
Rubbish.fish?('true') #=> true
Rubbish.fish?('false') #=> false

# Run a bash script, have it output to STDOUT...
Rubbish.bash? <<-BASH
  echo "Date/Time now: "
  date
BASH
#=> true

# Rubbish will accept :fish and :bash calls, but
# you can add other shells... say... ruby?
# sure, why not:
Rubbish::SHELL_VERSION[:ruby] = '3.0' # Ensures it's ruby ~>3.0.
answer = Rubbish.ruby <<-RUBY
  a = 5
  b = 6
  puts a+b
RUBY
#=> "11\n"
```
## FEATURES:

```ruby
Rubbish.shell('echo "OK"')              #=> "OK\n"
Rubbish.shell(shell:'fish'){|p| p.puts 'echo "OK"'}  #=> "OK\n"
Rubbish.bash('echo "OK"')                      #=> "OK\n"
Rubbish.fish('true')                           #=> ""
```
Exit status instead:
```ruby
Rubbish.shell('true', shell:'fish', read:false) #=> true
Rubbish.shell('false', shell:'fish', read:false) #=> false
Rubbish.fish?('true')  #=> true
Rubbish.fish?('false') #=> false
```
An edge case:
```ruby
b = nil
a = Rubbish.bash do |p|
  p.puts "echo Good"
  p.puts "echo Day!"
  b = p.gets
end
b #=> "Good\n"
a #=> "Day!\n"
```
Passing options to the "shell":
```ruby
Rubbish::SHELL_VERSION[:date] = nil
Rubbish.date date:'2021-09-21', R:true #=> "Tue, 21 Sep 2021 00:00:00 -0700\n"
```
## INSTALL:
```console
$ gem install rubbish
```
## LICENSE:

(The MIT License)

Copyright (c) 2023 CarlosJHR64

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
