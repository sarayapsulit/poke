def catch_pokemon(number)
  pokemon_hash = JSON.parse(open(URI.parse('http://pokeapi.co/api/v2/pokemon/'+ number.to_s + '/')).read)

  name =  pokemon_hash["name"]
  type = pokemon_hash["types"][0]["type"]["name"]
  pic = pokemon_hash["sprites"]["front_default"]
  return new_pokemon = {name: name, element: type, pic: pic, health: (rand(50) + 100) }
end

def make_move(number)
  pokemon_hash = JSON.parse(open(URI.parse('http://pokeapi.co/api/v2/pokemon/'+ number.to_s + '/')).read)
  move_list = pokemon_hash["moves"]
  move_number = rand(move_list.length) + 1
  if move_number == nil
    move_name = "tackle"
    move_type = "normal"
  else
    move = move_list[move_number]
    if move == nil
      move_name = "tackle"
      move_type = "normal"
    else
      move_name = move["move"]["name"]
      move_url = move["move"]["url"]
      move_hash = JSON.parse(open(URI.parse(move_url)).read)
      move_type = move_hash["type"]["name"]
    end
  end
  return new_move = {name: move_name, element: move_type ,attack_power: rand(19) +1 }
end
