require "rubygems"
require "bundler"
Bundler.require(:default, ENV["RACK_ENV"] || :development)

require './lib/tweet'

configure do
end

get "/" do
  @images = Tweet.all
  erb :index
end

error 400..510 do
  @code = response.status
  erb :error
end
