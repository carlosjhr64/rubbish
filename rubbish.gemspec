Gem::Specification.new do |s|

  s.name     = 'rubbish'
  s.version  = '1.0.221207'

  s.homepage = 'https://github.com/carlosjhr64/rubbish'

  s.author   = 'CarlosJHR64'
  s.email    = 'carlosjhr64@gmail.com'

  s.date     = '2022-12-07'
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

  s.requirements << 'ruby: ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [aarch64-linux]'
  s.requirements << 'bash: GNU bash, version 5.1.4(1)-release (aarch64-unknown-linux-gnu)'
  s.requirements << 'fish: fish, version 3.5.1'

end
