require 'sinatra'
require 'nokogiri'
require 'open-uri'
require 'json'

set :server, :thin

get '/' do
  send_file "views/index.html"
end

class Stream
  def each
    100.times { |i| yield "#{i}\n" }
  end
end

get('/bottles') { Stream.new }


get '/fetch' do

  doc = Nokogiri::HTML(open('https://github.com/'))
  response = {
    :content => doc.content,
    :some_other_shit => 'poop',
  }

  response.to_json
end

get '/json' do
  erb :json
end

get '/jsonp' do
  erb :jsonp
end