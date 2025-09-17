import 'package:flutter_pokelite/core/state/remote_state.dart';

abstract interface class PokemonListRepository {
  Future<RemoteState> getPokemonList(int page);
}
