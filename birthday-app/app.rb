require "sinatra"
require "sinatra/reloader" if development?

configure :production do
  enable :reloader
end

get "/" do # form
  erb :index
end

post "/birthday" do # birthday greetings & countdown
  p params
  @name = params[:name]
  @days = params[:days]
  erb :user_birthday
end
