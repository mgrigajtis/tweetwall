require "tweetwall/version"
require "twitter"

module Tweetwall
  def self.print_tweets(twitter_user, number_of_tweets=5)
    tweet_wall_html = ""
    twitter_feed = Twitter.user_timeline(twitter_user)[0..number_of_tweets]
    twitter_image = Twitter.user(twitter_user).profile_image_url

    tweet_wall_html = tweet_wall_html + '<div id="tweet_wall">'
    twitter_feed.each do |tweet|
      tweet_wall_html = tweet_wall_html + '<div class="tweet_image">'
      tweet_wall_html = tweet_wall_html + '<img src="' + twitter_image + '" alt="" class="tweet_image" /> '
      tweet_wall_html = tweet_wall_html + '<span class="tweet_text">' + tweet.text + '</span><br />'
      tweet_wall_html = tweet_wall_html + '</div>'
    end
    tweet_wall_html = tweet_wall_html + '</div>'

    tweet_wall_html
  end
end
