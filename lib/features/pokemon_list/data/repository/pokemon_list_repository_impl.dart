import 'package:flutter_pokelite/core/state/remote_state.dart';
import 'package:flutter_pokelite/features/pokemon_list/data/datasource/pokemon_list_datasource.dart';
import 'package:flutter_pokelite/features/pokemon_list/domain/repository/pokemon_list_repository.dart';

class PokemonListRepositoryImpl implements PokemonListRepository {
  final PokemonListDatasource _pokemonClient;

  PokemonListRepositoryImpl(this._pokemonClient);

  @override
  Future<RemoteState> getPokemonList(int page) async =>
      await _pokemonClient.getPokemonList(page);
}
