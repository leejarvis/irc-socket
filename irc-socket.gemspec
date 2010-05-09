spec = Gem::Specification.new do |s|
  s.name = 'irc-socket'
  s.version = '0.9.4'
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.rdoc"]
  s.rdoc_options += ["--quiet", '--main', 'README.rdoc']
  s.summary = "An IRC wrapper around TCPSocket"
  s.description = s.summary
  s.author = "Lee 'injekt' Jarvis"
  s.email = "ljjarvis@gmail.com"
  s.homepage = "http://rdoc.injekt.net/irc-socket"
  s.required_ruby_version = ">= 1.8.4"
  s.files = %w(README.rdoc Rakefile) + Dir["{spec,lib}/*"]
  s.require_path = "lib"
  
  s.add_development_dependency('rspec', '= 1.3.0')
end
