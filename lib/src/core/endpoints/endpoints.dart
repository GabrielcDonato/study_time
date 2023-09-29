sealed class PokedexEndpoints {
  static const String getAllPokemons =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  // https://pokeapi.co/api/v2/pokemon?limit=151&offset=0

  static const String getPokemonDetails =
      'https://pokeapi.co/api/v2/pokemon?limit=151&offset=0';
}
