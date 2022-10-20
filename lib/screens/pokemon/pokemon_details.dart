import 'package:flutter/material.dart';
import 'package:pokemon_app/components/row_tile.dart';
import 'package:pokemon_app/models/pokemon_model.dart';

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({super.key, required this.pokemon});

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    double imageSize = 200;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const SizedBox(
                    width: 50,
                    height: 50,
                    child: Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: Hero(
                    tag: "pokemon_image_${pokemon.id}",
                    child: Image.network(
                      pokemon.imageurl ?? "",
                      width: imageSize,
                      height: imageSize,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? const Color.fromRGBO(35, 35, 35, 1)
                      : const Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: isDarkMode
                          ? const Color.fromRGBO(255, 255, 255, 0.1)
                          : const Color.fromRGBO(0, 0, 0, 0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "${pokemon.name}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "(${pokemon.id})",
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w200,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${pokemon.xdescription}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 3,
                        margin: const EdgeInsets.only(top: 20, bottom: 20),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              RowTile(
                                title: "Height",
                                description: "${pokemon.height}",
                              ),
                              RowTile(
                                title: "Category",
                                description: "${pokemon.category}",
                              ),
                              RowTile(
                                title: "Weight",
                                description: "${pokemon.weight}",
                              ),
                              RowTile(
                                title: "Type of Pokemon",
                                description:
                                    (pokemon.typeofpokemon ?? []).join(' | '),
                              ),
                              RowTile(
                                title: "Speed",
                                description: "${pokemon.speed}",
                              ),
                              RowTile(
                                title: "HP",
                                description: "${pokemon.hp}",
                              ),
                              RowTile(
                                title: "Attack",
                                description: "${pokemon.attack}",
                              ),
                              RowTile(
                                title: "Defense",
                                description: "${pokemon.defense}",
                              ),
                              RowTile(
                                title: "Weaknesses",
                                description:
                                    (pokemon.weaknesses ?? []).join(' | '),
                              ),
                              RowTile(
                                title: "Evolutions",
                                description:
                                    (pokemon.evolutions ?? []).join(' | '),
                              ),
                              RowTile(
                                title: "Abilities",
                                description:
                                    (pokemon.abilities ?? []).join(' | '),
                              ),
                              RowTile(
                                title: "Special Attack",
                                description: "${pokemon.specialAttack}",
                              ),
                              RowTile(
                                title: "Special Defense",
                                description: "${pokemon.specialDefense}",
                              ),
                              RowTile(
                                title: "Total",
                                description: "${pokemon.total}",
                              ),
                              RowTile(
                                title: "Male Percentage",
                                description: "${pokemon.malePercentage}",
                              ),
                              RowTile(
                                title: "Female Percentage",
                                description: "${pokemon.femalePercentage}",
                              ),
                              RowTile(
                                title: "Egg Groups",
                                description: "${pokemon.eggGroups}",
                              ),
                              RowTile(
                                title: "Evolved From",
                                description: "${pokemon.evolvedfrom}",
                              ),
                              RowTile(
                                title: "Base Exp",
                                description: "${pokemon.baseExp}",
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
