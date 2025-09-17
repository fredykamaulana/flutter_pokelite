import 'package:flutter_pokelite/core/state/remote_state.dart';

abstract interface class PokemonDetailRepository {
  Future<RemoteState> getPokemonDetail(int id);
}
