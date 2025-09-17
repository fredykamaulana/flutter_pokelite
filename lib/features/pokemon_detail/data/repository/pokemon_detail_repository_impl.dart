import 'package:flutter_pokelite/core/state/remote_state.dart';
import 'package:flutter_pokelite/features/pokemon_detail/data/datasource/pokemon_detail_datasource.dart';
import 'package:flutter_pokelite/features/pokemon_detail/domain/repository/pokemon_detail_repository.dart';

class PokemonDetailRepositoryImpl implements PokemonDetailRepository {
  final PokemonDetailDatasource _pokemonDetailClient;

  PokemonDetailRepositoryImpl(this._pokemonDetailClient);

  @override
  Future<RemoteState> getPokemonDetail(int id) async =>
      await _pokemonDetailClient.getPokemonDetail(id);
}
