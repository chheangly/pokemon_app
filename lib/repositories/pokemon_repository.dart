import 'package:pokemon_app/models/pokemon_model.dart';
import 'package:http/http.dart' as http;

class PokemonRepository {
  final String _baseURL =
      "https://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json";

  Future<List<PokemonModel>> fetchAllPokemon() async {
    final res = await http.get(Uri.parse(_baseURL));
    if (res.statusCode == 200) {
      return pokemonModelFromJson(res.body);
    } else {
      throw Exception("Failed to load data");
    }
  }
}
