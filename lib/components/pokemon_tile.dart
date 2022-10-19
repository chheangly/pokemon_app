import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon_model.dart';
import 'package:pokemon_app/screens/pokemon/pokemon_details.dart';

class PokemonTile extends StatelessWidget {
  const PokemonTile({super.key, required this.pokemonModel});

  final PokemonModel pokemonModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PokemonDetails(
              pokemon: pokemonModel,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(92, 92, 92, 1),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Row(
          children: [
            Image.network(
              pokemonModel.imageurl ?? "",
              height: 80,
              width: 80,
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name : ${pokemonModel.name ?? ''}"),
                Text("ID : ${pokemonModel.id ?? ''}"),
                Text("Type : ${pokemonModel.typeofpokemon!.join(', ')}")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
