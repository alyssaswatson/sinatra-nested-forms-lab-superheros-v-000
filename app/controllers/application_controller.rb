require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/team' do
      #binding.pry
      @team = Team.new(params[:team])

      params[:team][:heros].each do |details|
        Heros.new(details)
      end
      @heros = Heros.all

      erb :team
    end
end
