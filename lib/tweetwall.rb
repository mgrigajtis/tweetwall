require "tweetwall/version"
require "twitter"

module Tweetwall
  def self.print_tweets(twitter_user, number_of_tweets=5)
    tweet_html = String.new
    tweet_wall_html = String.new
    twitter_image = String.new
    twitter_feed = Array.new

    begin
      # Get the tweets from the feed
      twitter_feed = Twitter.user_timeline(twitter_user)[0..number_of_tweets]

      # Get the twitter user's profile picture
      twitter_image = Twitter.user(twitter_user).profile_image_url

      tweet_wall_html = tweet_wall_html + '<div id="tweet_wall">'
      twitter_feed.each do |tweet|
        tweet_html = tweet.text

        # if there's a hyperlink, make it clickable
        words = tweet_html.split(" ")
        words.each do |word|
          if word.start_with?("http://") or word.start_with?("https://")
            tweet_html = tweet_html.gsub(word, '<a href="' + word + '" target="_blank">' + word + '</a>') 
          end
        end

        tweet_wall_html = tweet_wall_html + '<div class="tweet_line">'
        tweet_wall_html = tweet_wall_html + '<img src="' + twitter_image + '" alt="" class="tweet_image" /> '
        tweet_wall_html = tweet_wall_html + '<span class="tweet_text">' + tweet_html + '</span><br />'
        tweet_wall_html = tweet_wall_html + '</div>'
      end
      tweet_wall_html = tweet_wall_html + '</div>'

      tweet_wall_html
    rescue
      "Unable to fetch tweets."
    ensure
      twitter_feed = nil
      twitter_image = nil
      tweet_wall_html = nil
      tweet_html = nil
    end
  end
end
