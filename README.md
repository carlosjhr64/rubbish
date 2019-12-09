# rubbish

## DESCRIPTION:

A ruby-ish way to go to the shell.

Bash and Fish aware.

## SYNOPSIS:

    require 'rubbish'
    extend Rubbish::Fish
    a = fish <<FISH
      echo "But why???"
    FISH
    puts a+'Because!!!!'

## FEATURES:

Read by default:

* Rubbish.shell('bash','echo "OK"') #=> OK
* Rubbish.shell('bash'){|p| p.puts 'echo "OK"'}  #=> OK
* Rubbish.bash('echo "OK"') #=> OK
* Rubbish.fish('true') #=> ''
* Rubbish.fish('false') #=> ''

Passing false will not read, but get the exit status instead:

* Rubbish.fish('true', false) #=> true
* Rubbish.fish('false', false) #=> false

An edge case:

    require 'rubbish'
    b = nil
    a = Rubbish.bash do |p|
      p.puts "echo Good"
      p.puts "echo Day!"
      b = p.gets
    end
    puts b # Good
    puts a # Day!

## INSTALL:

    $ gem install rubbish

== LICENSE:

(The MIT License)

Copyright (c) 2019 carlosjhr64

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
