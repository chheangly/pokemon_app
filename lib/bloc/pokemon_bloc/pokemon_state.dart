import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:pokemon_app/models/pokemon_model.dart';

@immutable
abstract class PokemonState extends Equatable {}

class PokemonFetchingState extends PokemonState {
  @override
  List<Object?> get props => [];
}

class PokemonLoadedState extends PokemonState {
  final List<PokemonModel> pokemonList;
  PokemonLoadedState(this.pokemonList);

  @override
  List<Object?> get props => [pokemonList];
}

class PokemonErrorState extends PokemonState {
  final String error;

  PokemonErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
