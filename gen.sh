touch "views/$1.erb"
touch "public/css/$1.css"
echo "get '/$1' do
  erb :$1
end
" >> app.rb
