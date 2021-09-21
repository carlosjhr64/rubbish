Gem::Specification.new do |s|

  s.name     = 'rubbish'
  s.version  = '1.0.210921'

  s.homepage = 'https://github.com/carlosjhr64/rubbish'

  s.author   = 'CarlosJHR64'
  s.email    = 'carlosjhr64@gmail.com'

  s.date     = '2021-09-21'
  s.licenses = ['MIT']

  s.description = <<DESCRIPTION
A ruby-ish way to go to the shell.

Bash and Fish aware.
DESCRIPTION

  s.summary = <<SUMMARY
A ruby-ish way to go to the shell.
SUMMARY

  s.require_paths = ['lib']
  s.files = %w(
README.md
lib/rubbish.rb
  )

  s.requirements << 'ruby: ruby 3.0.2p107 (2021-07-07 revision 0db68f0233) [x86_64-linux]'
  s.requirements << 'bash: GNU bash, version 5.1.0(1)-release (x86_64-redhat-linux-gnu)'
  s.requirements << 'fish: fish, version 3.3.1'

end
