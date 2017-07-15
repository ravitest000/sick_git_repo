require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

desc 'Selenium WebDriver with Cucumber execution from rake'

task(:start_server) do
  ruby File.dirname(__FILE__)+'/demo/site.rb'
end

Cucumber::Rake::Task.new(:features) do |c|
  puts "directory is : #{File.dirname(__FILE__)}"
  c.cucumber_opts = "features --color --format pretty --format html -o #{File.dirname(__FILE__)}/reports/index.html"
end
