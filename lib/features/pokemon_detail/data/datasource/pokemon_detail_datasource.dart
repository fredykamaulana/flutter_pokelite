import 'package:flutter_pokelite/core/service/pokemon_service.dart';
import 'package:flutter_pokelite/core/state/remote_state.dart';

class PokemonDetailDatasource {
  final PokemonService service;
  PokemonDetailDatasource({required this.service});

  Future<RemoteState> getPokemonDetail(int id) async =>
      await service.getPokemonDetail(id: id);
}
