import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon_model.dart';
import 'package:pokemon_app/screens/pokemon/pokemon_details.dart';

class PokemonTile extends StatelessWidget {
  const PokemonTile({super.key, required this.pokemonModel});

  final PokemonModel pokemonModel;

  @override
  Widget build(BuildContext context) {
    double imageSize = 100;
    int numberOfColumns = 3;
    int cardHeight = 180;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

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
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                height: cardHeight - (imageSize / 2) - 20,
                padding: EdgeInsets.only(
                  top: (imageSize / 2),
                ),
                width:
                    (MediaQuery.of(context).size.width / numberOfColumns) - 20,
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? const Color.fromRGBO(35, 35, 35, 1)
                      : const Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: isDarkMode
                          ? const Color.fromRGBO(255, 255, 255, 0.1)
                          : const Color.fromRGBO(0, 0, 0, 0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "${pokemonModel.name}",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${pokemonModel.id}",
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    Text(
                      pokemonModel.typeofpokemon!.join(', '),
                    )
                  ],
                ),
              ),
            ),
            Hero(
              tag: "pokemon_hero_${pokemonModel.id}",
              child: Image.network(
                pokemonModel.imageurl ?? "",
                height: imageSize,
                width: imageSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
