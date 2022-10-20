import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class PokemonEvent extends Equatable {
  const PokemonEvent();
}

class LoadPokemonListEvent extends PokemonEvent {
  @override
  List<Object?> get props => [];
}

class SearchPokemonListEvent extends PokemonEvent {
  final String searchText;
  const SearchPokemonListEvent(this.searchText);

  @override
  List<Object?> get props => [];
}

class AddFavoritePokemonEvent extends PokemonEvent {
  final String pokemonID;
  const AddFavoritePokemonEvent(this.pokemonID);

  @override
  List<Object?> get props => [];
}
