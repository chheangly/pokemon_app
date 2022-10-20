import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/bloc/pokemon_bloc/pokemon_event.dart';
import 'package:pokemon_app/bloc/pokemon_bloc/pokemon_state.dart';
import 'package:pokemon_app/models/pokemon_model.dart';
import 'package:pokemon_app/repositories/pokemon_repository.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository _pokemonRepository;
  late List<PokemonModel> allPokemon;
  final List<String> favoriteIDs = [];

  PokemonBloc(this._pokemonRepository) : super(PokemonFetchingState()) {
    on<LoadPokemonListEvent>((event, emit) async {
      try {
        final pokemonList = await _pokemonRepository.fetchAllPokemon();
        allPokemon = pokemonList;
        emit(PokemonLoadedState(pokemonList));
      } catch (e) {
        emit(PokemonErrorState(e.toString()));
      }
    });
    on<SearchPokemonListEvent>((event, emit) {
      try {
        String searchText = event.searchText;
        emit(
          PokemonLoadedState(allPokemon
              .where(
                (a) => (a.name ?? "")
                    .toLowerCase()
                    .startsWith(searchText.toLowerCase()),
              )
              .toList()),
        );
      } catch (e) {
        emit(PokemonErrorState(e.toString()));
      }
    });
    on<AddFavoritePokemonEvent>((event, emit) {
      try {
        String pID = event.pokemonID;
        favoriteIDs.add(pID);
      } catch (e) {
        emit(PokemonErrorState(e.toString()));
      }
    });
  }
}
