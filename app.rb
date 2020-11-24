require 'sinatra'

set :server, :thin
#set :public_folder

get '/' do
  erb :index
end

get('/bottles', :provides => 'text/event-stream') do
  stream do |out|
    1000.times do |i|
      out << "#{i} bottle(s) on a wall...\n"
      sleep 0.5
    end
  end
end

get '/jsonb' do
  erb :jsonb
end

get '/recipe' do
  erb :recipe
end



