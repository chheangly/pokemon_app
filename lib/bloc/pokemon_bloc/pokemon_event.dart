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
