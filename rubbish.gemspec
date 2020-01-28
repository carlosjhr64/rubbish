Gem::Specification.new do |s|

  s.name     = 'rubbish'
  s.version  = '0.2.200128'

  s.homepage = 'https://github.com/carlosjhr64/rubbish'

  s.author   = 'carlosjhr64'
  s.email    = 'carlosjhr64@gmail.com'

  s.date     = '2020-01-28'
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

  s.requirements << 'ruby: ruby 2.7.0p0 (2019-12-25 revision 647ee6f091) [x86_64-linux]'
  s.requirements << 'bash: GNU bash, version 5.0.11(1)-release (x86_64-redhat-linux-gnu)'
  s.requirements << 'fish: fish, version 3.0.2'

end
