require 'open-uri'
require 'json'

get "/pokemon/:id/battle" do
  @pokemon = Pokemon.find(params[:id])
  poke_num = rand(150) + 1
  @enemy_pokemon =  catch_pokemon(poke_num)
  erb :'/pokemon/battle'
end

post "/pokemon" do
  poke_num = rand(150) + 1
  new_pokemon = catch_pokemon(poke_num)
  pokemon = Pokemon.new(new_pokemon)
  pokemon.user = current_user
  binding.pry
  pokemon.save
  4.times do
    new_move = make_move(poke_num)
    move = Move.create(new_move)
    move.pokemon = pokemon
  end
  redirect "/users/#{current_user.id}"
end
get "/pokemon/:id/canvas_battle" do
  @pokemon = Pokemon.find(params[:id])
  poke_num = rand(150) + 1
  @enemy_pokemon =  catch_pokemon(poke_num)
  erb :'/pokemon/index'
end

get "/pokemon/:id" do
  @pokemon = Pokemon.find(params[:id])
  erb :'/pokemon/show'
end

post '/pokemon/:id/move' do
  pokemon = Pokemon.find(params[:id])
  if request.xhr?
    params[:attack_power]
  else
    redirect "/pokemon/#{pokemon.id}"
  end
end
