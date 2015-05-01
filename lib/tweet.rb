class Tweet < ActiveRecord::Base

  # Given a hashtag, scrape twitter for more tweets about it.
  def self.get_more hashtag
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "fUl6gF9JYQjzDTDZPdtucRyho"
      config.consumer_secret     = "oyoYPAghC0NgLGp4YukAdK2jSAeCsmDnBN3SYomPZt3sE4eahd"
      config.access_token        = "3576561-Jg3VlvSLARfDG6LJFIxT3vgnJGmAiuNSUOgGD8HMLu"
      config.access_token_secret = "NbPwRrN0frdH0a5vjU08k3gV0muBmBO4iywFWcCIIHOCU"
    end

    client.search("##{hashtag}", result_type: "mixed").take(1000).each do |tweet|
      t = Tweet.find_or_create_by(link: "https://twitter.com/statuses/#{tweet.id}")
      t.screenname = tweet.user.screen_name
      t.text = tweet.text
      t.posted = tweet.created_at
      t.save
    end

    return true
  end
end
