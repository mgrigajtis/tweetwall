require "tweetwall/version"

module Tweetwall
  def print_tweets(twitter_user, number_of_tweets=5)
    tweet_wall_html = ""
    twitter_feed = Twitter.user_timeline(twitter_user)[0..number_of_tweets]

    tweet_wall_html = tweet_wall_html + '<div id="tweet_wall">'
    twitter_feed.each do |tweet|
      tweet_wall_html = tweet_wall_html + '<span class="tweet_text">' + tweet.text + '</span><br />'
    end
    tweet_wall_html = tweet_wall_html + '</div>'

    tweet_wall
  end
end
