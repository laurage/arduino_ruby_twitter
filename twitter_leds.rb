# twitter_leds.rb

require 'yaml'
require 'tweetstream'
require 'dino'

auth = YAML::load_file("twitter_api_config.yml")

TweetStream.configure do |config|
    config.consumer_key       = auth["consumer_key"]
    config.consumer_secret    = auth["consumer_secret"]
    config.oauth_token        = auth["oauth_token"]
    config.oauth_token_secret = auth["oauth_token_secret"]
end

board = Dino::Board.new(Dino::TxRx::Serial.new)
redled = Dino::Components::Led.new(pin: 13, board: board)
greenled = Dino::Components::Led.new(pin: 12, board: board)

awesome = ['awesome','very good','happy', 'nice', ':-)' , ':)', 'super', 'crazy', 'good', 'fun', 'love', 'amazing']
awful = ['not good', 'bad', 'sad', 'not happy','not like', 'dislike', 'not good', ':(', ':-(', 'not fun', 'not good', 'not nice', 'hate', 'not fun', 'horrible']

TweetStream::Client.new.track("elections") do |status|
    puts status.text      # prints the tweet to screen.
    twit = status.text
    if awful.any? { |w| twit.include? w }
      puts '**sad tweet**'
      redled.send(:on)
      sleep 3
      redled.send(:off)
      sleep 1
    elsif awesome.any? { |w| twit.include? w }
        puts '--happy tweet--'
        greenled.send(:on)
        sleep 3
        greenled.send(:off)
        sleep 1
    end
end
