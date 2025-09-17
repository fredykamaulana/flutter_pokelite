import 'package:flutter_pokelite/core/state/remote_state.dart';
import 'package:flutter_pokelite/features/pokemon_detail/domain/entities/pokemon_detail_entity.dart';

class PokemonDetailState {
  RemoteState? state;
  int? pokemonId;
  PokemonDetailEntity? detail;

  PokemonDetailState({this.state, this.pokemonId, this.detail});
}
