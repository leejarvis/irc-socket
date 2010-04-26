require "rake"
require "rake/clean"
require "rake/gempackagetask"
require "spec/rake/spectask"
require "rake/rdoctask"

NAME = 'irc-socket'
VERSION = '0.9.3'
CLEAN.include ["*.gem", "rdoc"]

RDOC_OPTS = [
  "-U", "--main", "README.rdoc",
  "--op", "rdoc",
]

Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = "rdoc"
  rdoc.options += RDOC_OPTS
  rdoc.rdoc_files.add %w(README.rdoc lib/irc-socket.rb)
end

desc "Run specs"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = Dir['spec/*.rb']
end

desc "Package"
task :package => [:clean] do |p|
  sh "gem build #{NAME}.gemspec"
end

desc "Install gem"
task :install => [:package] do
  sh "sudo gem install ./#{NAME}-#{VERSION} --local"
end

desc "Uninstall gem"
task :uninstall => [:clean] do
  sh "sudo gem uninstall #{NAME}"
end

desc "Upload gem to gemcutter"
task :release => [:package] do
  sh "gem push ./#{NAME}-#{VERSION}.gem"
end

desc "Print #{NAME} version"
task :version do
  puts VERSION
end

desc "Upload rdoc to injekt.net"
task :upload => [:clean, :rdoc] do
  sh("scp -r rdoc/* injekt@injekt.net:/var/www/injekt.net/rdoc/irc-socket")
end

task :default => [:spec]

