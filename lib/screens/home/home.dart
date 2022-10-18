import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/bloc/pokemon_bloc/pokemon_bloc.dart';
import 'package:pokemon_app/bloc/pokemon_bloc/pokemon_event.dart';
import 'package:pokemon_app/bloc/pokemon_bloc/pokemon_state.dart';
import 'package:pokemon_app/repositories/pokemon_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PokemonBloc(
        RepositoryProvider.of<PokemonRepository>(context),
      )..add(LoadPokemonListEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Pokemon List"),
        ),
        body: BlocBuilder<PokemonBloc, PokemonState>(
          builder: ((context, state) {
            if (state is PokemonFetchingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is PokemonLoadedState) {
              return Container();
            }
            if (state is PokemonErrorState) {
              return Center(
                child: Text(state.error.toString()),
              );
            }
            return Container();
          }),
        ),
      ),
    );
  }
}
