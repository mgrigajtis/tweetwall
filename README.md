# Tweetwall

This Gem makes it very wasy to add a Tweet Wall of Twitter feeds for a particular Twitter user
on your web application.

## Installation

Add this line to your application's Gemfile:

    gem 'tweetwall'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tweetwall

## Usage

The print_tweets method returns an HTML division of Tweets.
Simply call the print_tweets method like so:
Tweetwall.print_tweets("oceancucumber")

You'll get the full tweet_wall HTML division

Optionally, you can specify the number of tweets:
Tweetwall.print_tweets("oceancucumber", 10)

There is also a function that you can call that will only print
the Tweet content.  This is useful if you want to do an AJAX
refresh on the tweet_wall division without refreshing the entire
page:
Tweetwall.print_tweet_content("oceancucumber", 10)

The number of tweets is again optional.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
