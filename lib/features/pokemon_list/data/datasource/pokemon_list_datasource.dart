import 'package:flutter_pokelite/core/service/pokemon_service.dart';
import 'package:flutter_pokelite/core/state/remote_state.dart';

class PokemonListDatasource {
  PokemonService service;

  PokemonListDatasource({required this.service});

  static const pagingSize = 10;

  Future<RemoteState> getPokemonList(int page) async => await service
      .getPokemonList(limit: pagingSize, offset: page * pagingSize);
}
