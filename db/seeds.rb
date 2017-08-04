require 'open-uri'
require 'json'
require 'faker'

User.delete_all
Pokemon.delete_all
Move.delete_all

users = []
10.times do
  users << User.create(username: Faker::Name.last_name , email: Faker::Internet.email, password: "pw")
end

4.times do
  users.each do |user|

    user_input = (rand(151) +1 )
    pokemon_api = URI.parse('http://pokeapi.co/api/v2/pokemon/'+ user_input.to_s + '/')
    pokemon_hash= JSON.parse(open(pokemon_api).read)
    pokemon = Pokemon.create(name: pokemon_hash["name"], element: pokemon_hash["types"][0]["type"]["name"], pic: pokemon_hash["sprites"]["front_default"], user: user, health: rand(50) +100 )
    4.times do
      pokemon_move_list = pokemon_hash["moves"]

      move_number = rand(pokemon_move_list.length) + 1
      if move_number == nil
        move_name = "tackle"
        type = "normal"
      else
        move = pokemon_move_list[move_number]
        if move == nil
          move_name = "tackle"
          type = "normal"
        else
          move_name = move["move"]["name"]
          move_type_url = move["move"]["url"]
          move_hash= JSON.parse(open(URI.parse(move_type_url)).read)
          type = move_hash["type"]["name"]
        end


      end
      Move.create(name: move_name, element: type, attack_power: (rand(20)+1), pokemon: pokemon)
    end
  end
end
