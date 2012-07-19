require 'rubygems'
require 'rake'

require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new

# TODO: simplecov

namespace :parser do

  desc "Compile the parser"
  task :compile do
    require 'treetop'
    compiler = Treetop::Compiler::GrammarCompiler.new
    treetop_dir = File.expand_path(File.join(File.dirname(__FILE__), "lib", "webidl", "parser"))
    Dir[File.join(treetop_dir, "*.{tt,treetop}")].each do |treetop_file_path|
      compiler.compile(treetop_file_path)
    end
  end
end

namespace :webidl do
  WEBIDL_URL = "http://dev.w3.org/2006/webapi/WebIDL/"
  HTML5_URL = "http://www.whatwg.org/specs/web-apps/current-work/"

  desc "Download the webidl spec to support/"
  task :download do
    require 'open-uri'
    spec_file = "support/webidl-spec-#{Time.now.strftime "%Y-%m-%d"}.html"
    size = 0

    File.open(spec_file, "w") do |file|
      file << data = open(SPEC_URL).read
      size = data.bytesize
    end

    puts "#{WEBIDL_URL} => #{spec_file} (#{size} bytes)"
  end

  desc "Download and extract HTML5 IDL parts to spec/fixtures"
  task :html5 do
    require 'open-uri'
    require 'nokogiri'

    idl_file = "spec/fixtures/html5.idl"
    size = 0

    File.open(idl_file, "w") do |file|
      file << data = Nokogiri.HTML(open(HTML5_URL)).css("pre.idl").map { |e| e.inner_text }.join("\n\n")
      size = data.bytesize
    end

    puts "#{HTML5_URL} => #{idl_file} (#{size} bytes)"
  end

end

task :default => :spec

begin
  require 'yard'
  YARD::Rake::YardocTask.new
rescue LoadError
  task :yardoc do
    abort "YARD is not available. In order to run yardoc, you must: sudo gem install yard"
  end
end
