import 'package:flutter_pokelite/core/state/remote_state.dart';
import 'package:flutter_pokelite/features/pokemon_list/domain/repository/pokemon_list_repository.dart';

class GetPokemonListUsecase {
  final PokemonListRepository repository;

  GetPokemonListUsecase({required this.repository});

  Future<RemoteState> getPokemonList(int page) async {
    return await repository.getPokemonList(page);
  }
}
