require 'sinatra/base'

class App < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }
  
  get '/' do
    erb :super_hero
  end
  
  post '/team' do
    @team_name = params[team][name]
    @motto = params[team][motto]
    
    @heros_name = []
    @heros_power = []
    @heros_bio = []
    
    @members = params[:team][:members]
    @members.each do |hero|
      @heros_name << hero[:name]
      @heros_power << hero[:power]
      @heros_bio << hero[:bio]
    end
    erb :team
  end
end
