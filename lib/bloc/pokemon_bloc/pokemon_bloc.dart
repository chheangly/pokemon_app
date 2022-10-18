import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/bloc/pokemon_bloc/pokemon_event.dart';
import 'package:pokemon_app/bloc/pokemon_bloc/pokemon_state.dart';
import 'package:pokemon_app/repositories/pokemon_repository.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository _pokemonRepository;

  PokemonBloc(this._pokemonRepository) : super(PokemonFetchingState()) {
    on<LoadPokemonListEvent>((event, emit) async {
      try {
        final pokemonList = await _pokemonRepository.fetchAllPokemon();
        emit(PokemonLoadedState(pokemonList));
      } catch (e) {
        emit(PokemonErrorState(e.toString()));
      }
    });
  }
}
