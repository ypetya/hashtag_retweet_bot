require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('hashtag_retweet_bot', '0.1.1') do |p|
  p.description    = "Script that listens to a tag and retweets messages with that tag. Originally made for Scotland on Rails '09 by Mark Connell (http://github.com/rubaidh)"
  p.url            = "http://github.com/jaimeiniesta/hashtag_retweet_bot"
  p.author         = "Jaime Iniesta"
  p.email          = "jaimeiniesta@gmail.com"
  p.ignore_pattern = ["tmp/*", "config/*", "script/*", "*.txt", "pkg"]
  p.development_dependencies = ["twibot >=0.1.7", "activerecord", "pauldix-feedzirra >=0.0.12"]
  p.runtime_dependencies = ["twibot >=0.1.7", "activerecord", "pauldix-feedzirra >=0.0.12"]
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
