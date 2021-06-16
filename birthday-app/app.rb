require "sinatra"
require "sinatra/reloader" if development?

configure :production do
  enable :reloader
end

get "/" do # form
  erb :index
end

post "/birthday" do # birthday greetings & countdown
  puts params
  @name = params[:name]
  @day = params[:day]
  @days_left = 8
  erb :user_birthday
end
