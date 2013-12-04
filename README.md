# Tweetwall

This Gem makes it very wasy to add a Tweet Wall of Twitter feeds for a particular Twitter user
on your web application.  This Gem takes care of making the hyperlinks, usernames, and hash tags
clickable.

## Installation

Add these lines to your application's Gemfile:

    gem "twitter"
    gem 'tweetwall'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tweetwall

## Usage

The print_tweets method returns an HTML division of Tweets.
Simply call the print_tweets method like so:
Tweetwall.print_tweets("oceancucumber", 5, consumer_key, consumer_secret)

You'll get the full tweet_wall HTML division

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
