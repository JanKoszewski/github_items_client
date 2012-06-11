task :console do
  $: << File.expand_path("../lib", __FILE__)
  require 'github_items_client'

  ARGV.clear
  require 'irb'
  IRB.start
end