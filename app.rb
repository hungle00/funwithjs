require 'sinatra'
require 'redcarpet'


class MyApp < Sinatra::Base

  set :server, :thin
  
  get '/' do
    erb :index
  end

  get '/click' do
    erb :click_event
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

    erb :_image, :layout => false
  end

  get '/weather' do
    erb :weather
  end

  get '/quotes' do
    erb :quotes
  end


  #### MARKDOWN 

  parser_options = {
    autolink: true,
    tables: true,
    fenced_code_blocks: true,
    disable_indented_code_blocks: true,
    underline: true
  }

  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,  parser_options)

  get '/markdown' do
    @mds = Dir.entries("./pages")[2..-1]

    erb :show_md
  end

  post '/markdown/show' do
    input = File.read "./pages/#{params['md']}"
    markdown.render(input)
  end

  get '/markdown/new' do
    erb :markdown
  end

  post '/markdown/preview' do
    markdown.render(params['md'])
  end

  post '/markdown/create' do
    @text = params[:s]

    File.open("./pages/new.md", 'wb') do |f|
      f.write(@text)
    end
  end
end

