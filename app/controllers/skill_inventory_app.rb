require 'models/skill_inventory'

class SkillInventoryApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')

  # get '/' do
  #   erb :dashboard
  # end

  end
  get '/skills' do
    erb :index
  end

  
end
