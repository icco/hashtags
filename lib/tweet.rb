class Tweet < ActiveRecord::Base

  # Given a hashtag, scrape twitter for more tweets about it.
  def self.get_more hashtag
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "fUl6gF9JYQjzDTDZPdtucRyho"
      config.consumer_secret     = "oyoYPAghC0NgLGp4YukAdK2jSAeCsmDnBN3SYomPZt3sE4eahd"
      config.access_token        = "3576561-Jg3VlvSLARfDG6LJFIxT3vgnJGmAiuNSUOgGD8HMLu"
      config.access_token_secret = "NbPwRrN0frdH0a5vjU08k3gV0muBmBO4iywFWcCIIHOCU"
    end

    client.search("##{hashtag}", result_type: "mixed").each do |tweet|
      p "#{tweet.user.screen_name}: #{tweet.text}"
    end
  end
end
