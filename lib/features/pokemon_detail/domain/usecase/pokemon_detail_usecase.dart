import 'package:flutter_pokelite/core/state/remote_state.dart';
import 'package:flutter_pokelite/features/pokemon_detail/domain/repository/pokemon_detail_repository.dart';

class PokemonDetailUsecase {
  final PokemonDetailRepository repository;
  PokemonDetailUsecase({required this.repository});

  Future<RemoteState> getPokemonDetail(int id) async {
    return await repository.getPokemonDetail(id);
  }
}
