import 'package:flutter/foundation.dart';
import 'package:pokemon_app/models/pokemon_model.dart';

@immutable
abstract class PokemonState {}

class PokemonFetchingState extends PokemonState {}

class PokemonLoadedState extends PokemonState {
  final List<PokemonModel> pokemonList;
  PokemonLoadedState(this.pokemonList);
}

class PokemonErrorState extends PokemonState {
  final String error;
  PokemonErrorState(this.error);
}
