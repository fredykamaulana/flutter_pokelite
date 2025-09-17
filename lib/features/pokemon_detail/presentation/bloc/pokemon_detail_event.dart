abstract class PokemonDetailEvent {}

class FetchPokemonDetail extends PokemonDetailEvent {
  final int pokemonId;

  FetchPokemonDetail({required this.pokemonId});
}
