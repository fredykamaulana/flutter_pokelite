import 'package:flutter_pokelite/core/state/ui_state.dart';
import 'package:flutter_pokelite/features/pokemon_list/domain/entities/pokemon_entity.dart';

class PokemonListState {
  UiState? state;
  List<PokemonEntity>? pokemonList;
  int? pageCount;

  PokemonListState({this.state, this.pokemonList, this.pageCount});
}
