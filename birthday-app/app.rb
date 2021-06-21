require "date"
require "sinatra"
require "sinatra/reloader" if development?

configure :production do
  enable :reloader
end

get "/" do
  erb :index
end

post "/birthday" do
  # puts params => {"name"=>"Lola", "day"=>"4", "month"=>"may"}
  @name = params[:name]
  @day = params[:day].to_i
  @birth_month = params[:month].capitalize!
  month = Date::ABBR_MONTHNAMES.index(@birth_month) # Date::MONTHNAMES.index("Jun") => 6
  year = Time.now.year
  birth_day = Date.new(year, month, @day)
  today = Date.today

  if birth_day > today
    @days_left = (birth_day - today).to_i
  else
    @days_left = (birth_day.next_year - today).to_i
  end

  @plural = "s" if (@days_left > 1)
  erb :user_birthday
end
