require 'sinatra'

class MyApp < Sinatra::Base

  set :server, :thin

  get '/' do
    erb :index
  end

  get '/stream' do
    erb :stream
  end

  get('/stream', :provides => 'text/event-stream') do
    stream do |out|
      1000.times do |i|
        out << "#{i} bottle(s) on a wall...\n"
        sleep 0.5
      end
    end
  end

  get '/wiki' do
    erb :wiki
  end

  get '/recipe' do
    erb :recipe
  end

  get '/upload' do
    erb :upload
  end

  post '/upload' do
    @filename = params[:file][:filename]
    file = params[:file][:tempfile]

    File.open("./public/file_upload/#{@filename}", 'wb') do |f|
      f.write(file.read)
    end

    erb :show_image
  end

  get '/weather' do
    erb :weather
  end
end

