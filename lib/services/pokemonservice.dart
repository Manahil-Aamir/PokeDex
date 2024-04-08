import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon.dart';

class PokemonService {
  Future<List<Pokemon>> getAllPokemons() async {
    final response =
        await http.get(Uri.parse(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['pokemon'];
      List<Pokemon> pokemonList = data.map((e) {
        return Pokemon(
          id: e['id'],
          num: e['num'],
          name: e['name'],
          img: e['img'],
          type: List<String>.from(e['type']),
          height: e['height'],
          weight: e['weight'],
          candy: e['candy'],
          candyCount: e['candy_count'] != null ? e['candy_count'] : 0,

          egg: e['egg'],
          spawnChance: e['spawn_chance'] is int ? (e['avg_spawns'] as int).toDouble() : e['spawn_chance'],
          avgSpawns: e['avg_spawns'] is int ? (e['avg_spawns'] as int).toDouble() : e['avg_spawns'],

          spawnTime: e['spawn_time'],
          multipliers: e['multipliers'] != null ? List<double>.from(e['multipliers']) : [],

          weaknesses: List<String>.from(e['weaknesses']),
          nextEvolution : e['next_evolution'] != null
          ? List<Evolution>.from(e['next_evolution'].map((x) => Evolution.fromJson(x)))
          : [],
          prevEvolution : e['prev_evolution'] != null
          ? List<Evolution>.from(e['prev_evolution'].map((x) => Evolution.fromJson(x)))
          : [],


        );
      }).toList();
      return pokemonList;
    } else {
      throw Exception("Failed to get data");
    }
  }
}