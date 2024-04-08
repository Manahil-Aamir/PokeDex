import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/services/pokemonservice.dart';

class PokemonProvider extends ChangeNotifier{
  final _service = PokemonService();
  bool isLoading =false;
  List<Pokemon> _pokemons = [];

  //giving read access
  List<Pokemon> get pokemons => _pokemons;

  Future<void> getAllPokemons() async {
    isLoading=true;
    notifyListeners();
    final response = await _service.getAllPokemons();

    _pokemons = response;
    isLoading =false;
    notifyListeners();
  }
}