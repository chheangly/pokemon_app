import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon_model.dart';

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({super.key, required this.pokemon});

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    double imageSize = 150;

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          Stack(
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Hero(
                    tag: "pokemon_hero_${pokemon.id}",
                    child: Image.network(
                      pokemon.imageurl ?? "",
                      width: imageSize,
                      height: imageSize,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
