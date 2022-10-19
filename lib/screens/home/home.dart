import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/bloc/pokemon_bloc/pokemon_bloc.dart';
import 'package:pokemon_app/bloc/pokemon_bloc/pokemon_event.dart';
import 'package:pokemon_app/bloc/pokemon_bloc/pokemon_state.dart';
import 'package:pokemon_app/bloc/theme_bloc/theme_bloc.dart';
import 'package:pokemon_app/bloc/theme_bloc/theme_event.dart';
import 'package:pokemon_app/components/pokemon_tile.dart';
import 'package:pokemon_app/global/themes/app_theme.dart';
import 'package:pokemon_app/models/pokemon_model.dart';
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
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Theme.of(context).brightness == Brightness.dark
                    ? Icons.light_mode
                    : Icons.dark_mode,
              ),
              onPressed: () {
                BlocProvider.of<ThemeBloc>(context).add(
                  ThemeChangedEvent(
                    Theme.of(context).brightness == Brightness.dark
                        ? AppTheme.lightTheme
                        : AppTheme.darkTheme,
                  ),
                );
              },
            )
          ],
        ),
        body: BlocBuilder<PokemonBloc, PokemonState>(
          builder: ((context, state) {
            if (state is PokemonFetchingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is PokemonLoadedState) {
              List<PokemonModel> pokemons = state.pokemonList.sublist(0, 15);
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: const TextField(),
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 180,
                        crossAxisCount: 3,
                      ),
                      itemCount: pokemons.length,
                      itemBuilder: ((context, index) {
                        return PokemonTile(
                          pokemonModel: pokemons[index],
                        );
                      }),
                    ),
                  )
                ],
              );
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
