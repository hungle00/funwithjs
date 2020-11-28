touch "views/$1.erb"
touch "public/stylesheets/$1.css"
echo "get '/$1' do
  erb :$1
end
" >> app.rb
