require "tweetwall/version"
require "twitter"

module Tweetwall

  public

  # This method prints the entire DIV of the tweet_wall in your html
  def self.print_tweets(twitter_user, number_of_tweets=5, consumer_key, consumer_secret)
    begin
      '<div id="tweet_wall">' + self.print_tweet_content(twitter_user, number_of_tweets, consumer_key, consumer_secret) + '</div>'
    rescue
      ""
    end
  end

  private

  # This method prints out just the tweet content.  Usefull if you want to do an AJAX refresh
  # of your Tweets without reloading the whole page
  def self.print_tweet_content(twitter_user, number_of_tweets=5, consumer_key, consumer_secret)
    begin
      client = Twitter::REST::Client.new do |config|
        config.consumer_key = consumer_key
        config.consumer_secret = consumer_secret
      end

      # working with an array that starts at 0
      number_of_tweets = number_of_tweets - 1

      # Get the tweets from the feed
      twitter_feed = client.user_timeline(twitter_user)[0..number_of_tweets]

      # Get the twitter user's profile picture
      twitter_image = client.user(twitter_user).profile_image_url

      # This variable needs to be declared because of the scop of the each\do block
      tweet_content = String.new

      twitter_feed.each do |tweet|
        # Process the tweet
        tweet_html = tweet.text

        words = tweet_html.split(" ")
        words.each do |word|
          # if there's a hyperlink, make it clickable
          if word.start_with?("http://") or word.start_with?("https://")
            tweet_html = tweet_html.gsub(word, '<a href="' + word + '" target="_blank">' + word + '</a>')
          end
    
          # if someone has been mentioned, make that clickable
          if word.start_with?("@")
            tweet_html = tweet_html.gsub(word, '<a href="http://www.twitter.com/#!/' + word.gsub(/\W$/, "").gsub("@", "") + '" target="_blank">' + word + '</a>')
          end

          # make the hashtag clickable
          if word.start_with?("#")
            tweet_html = tweet_html.gsub(word, '<a href="https://twitter.com/#!/search/' + word.gsub("#", "%23") + '">' + word + '</a>')
          end
        end

        tweet_content = tweet_content + '<div class="tweet_line">'
        tweet_content = tweet_content + '<a href="http://www.twitter.com/#!/' + twitter_user + '" target="_blank"><img src="' + twitter_image + '" alt="" class="tweet_image" /></a> '
        tweet_content = tweet_content + '<span class="tweet_text">' + tweet_html + '</span><br />'
        tweet_content = tweet_content + '</div>'
      end

      tweet_content
    rescue Exception => e
      #"Tweets not available"
      puts e.message  
      puts e.backtrace.inspect  
    end
  end

end
