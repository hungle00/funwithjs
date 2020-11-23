require 'sinatra'

set :server, :thin

get '/' do
  send_file "html/index.html"
end

get '/bottles', provides: 'text/event-stream' do
  stream do |out|
  	100.times do |i|
  	  out << "#{i} bottle(s) on a wall...\n"
      sleep 0.5
  	end
  end
end