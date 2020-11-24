touch "views/$1.erb"
echo "get '/$1' do
  erb :$1
end
" >> app.rb
