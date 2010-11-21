Gem::Specification.new do |s|
  s.name = 'irc-socket'
  s.version = '1.0.1'
  s.summary = "An IRC wrapper around TCPSocket"
  s.description = s.summary
  s.author = "Lee Jarvis"
  s.email = "lee@jarvis.co"
  s.homepage = "http://rubydoc.info/github/injekt/irc-socket"
  s.required_ruby_version = ">= 1.8.6"
  s.files = ['README.rdoc', 'LICENSE', 'lib/irc-socket.rb', 'spec/irc-socket_spec.rb']
  s.add_development_dependency('rspec', '= 2.1.0')
end
