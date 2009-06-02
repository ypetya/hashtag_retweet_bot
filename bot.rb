require 'rubygems'
require 'twibot' # our bot helper
require 'active_record' # db
require 'feedzirra' # feed helper

ActiveRecord::Base.establish_connection(
  :adapter => "mysql",
  :username => "root",
  :host => "localhost",
  :password => "",
  :database => "twibot"
)

class Tweets < ActiveRecord::Base
end

###
#  What we want the bot to do
###
#  1. Listen to an rss feed and store that stuff
#  2. Work out which tweets need to be tweeted by the bot
#  3. send the tweets and mark them as 'tweeted'
#

def get_tweets_tagged_with(tag)
  Feedzirra::Feed.fetch_and_parse("http://search.twitter.com/search.atom?q=+%23#{tag}")
end

tag = ARGV.first

feed_thread = Thread.new do
  while(true != false)
    begin
      # fetch the feed
      feed = get_tweets_tagged_with(tag)
      feed.entries.reverse.each do |entry|
        tweet = Tweets.find_or_create_by_twitter_id(
                  :twitter_id => entry.id,
                  :published  => entry.published,
                  :title      => entry.title,
                  :content    => entry.content,
                  :link       => entry.url
                )

        if tweet.tweeted.blank?
          origin = tweet.link.gsub(/^http.*com\//,"").gsub(/\/statuses\/\d*/,"")
          # strip only the # from the tag in the middle of the tweet (since it is part of the tweet)
          message = tweet.title.gsub(Regexp.new("#(#{tag})(\S+)", Regexp::IGNORECASE), '\1\2')
          # strip the whole tag at the end of the tweet (since it is just for tagging)
          message = message.gsub(Regexp.new("#(#{tag})\s*$", Regexp::IGNORECASE), '')
          if origin.size + message.size  <= 135
            twitter.status(:post, "RT @#{origin}: #{message}")
          else
            twitter.status(:post, "RT @#{origin} tagged '#{tag}': #{tweet.link}")
          end
          puts "#{Time.now.to_s(:long)}" # poor mans logging
          tweet.update_attribute(:tweeted, true)
        end
      end
    rescue
    end
    sleep(60)
  end
end

feed_thread.join
