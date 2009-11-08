require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name        = "webidl"
    gem.summary     = %Q{WebIDL parser/generator for ruby}
    gem.description = %Q{Built on Treetop, this gem will parse an interface declaration in WebIDL and generate ruby code}
    gem.email       = "jari.bakken@gmail.com"
    gem.homepage    = "http://github.com/jarib/webidl"
    gem.authors     = ["Jari Bakken"]
    gem.bindir      = "bin"

    gem.add_dependency "treetop"
    gem.add_dependency "ruby2ruby"
    gem.add_development_dependency "rspec"
  end
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern   = 'spec/**/*_spec.rb'
  spec.rcov      = true
  spec.rcov_opts = %w[--exclude spec,ruby-debug,/Library/Ruby,.gem --include lib/webidl]
end

namespace :parser do
  task :compile do
    require 'treetop'
    compiler = Treetop::Compiler::GrammarCompiler.new
    treetop_dir = File.expand_path(File.join(File.dirname(__FILE__), "lib", "webidl", "parser"))
    Dir[File.join(treetop_dir, "*.{tt,treetop}")].each do |treetop_file_path|
      compiler.compile(treetop_file_path)
    end
  end
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION')
    version = File.read('VERSION')
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "webidl #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
