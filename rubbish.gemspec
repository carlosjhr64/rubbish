Gem::Specification.new do |s|

  s.name     = 'rubbish'
  s.version  = '0.1.191210'

  s.homepage = 'https://github.com/carlosjhr64/rubbish'

  s.author   = 'carlosjhr64'
  s.email    = 'carlosjhr64@gmail.com'

  s.date     = '2015-12-26'
  s.licenses = ['MIT']

  s.description = <<DESCRIPTION
A ruby-ish way to go to the shell.

Bash and Fish aware.
DESCRIPTION

  s.summary = <<SUMMARY
A ruby-ish way to go to the shell.
SUMMARY

  s.extra_rdoc_files = ['README.rdoc']
  s.rdoc_options     = ["--main", "README.rdoc"]

  s.require_paths = ["lib"]
  s.files = %w(
README.rdoc
lib/rubbish.rb
lib/rubbish/bash.rb
lib/rubbish/fish.rb
lib/rubbish/rubbish.rb
lib/rubbish/version.rb
  )

  s.requirements << 'ruby: ruby 2.2.3p173 (2015-08-18 revision 51636) [x86_64-linux]'
  s.requirements << 'bash: GNU bash, version 4.2.53(1)-release (x86_64-redhat-linux-gnu)'
  s.requirements << 'fish: 2.1.1'

end
