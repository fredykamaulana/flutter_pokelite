import 'package:flutter_pokelite/core/injections/pokemon_detail/pokemon_detail_service_locator.dart';
import 'package:flutter_pokelite/core/injections/pokemon_list/pokemon_list_service_locator.dart';
import 'package:flutter_pokelite/core/service/pokemon_service.dart';
import 'package:get_it/get_it.dart';

final GetIt serviceLocator = GetIt.instance;

class ServiceLocator {
  Future setup() async {
    serviceLocator.registerLazySingleton<PokemonService>(
      () => PokemonService(),
      instanceName: 'PokemonService',
    );

    final pokemonListServiceLocator = PokemonListServiceLocator(serviceLocator);
    pokemonListServiceLocator.setup();

    final pokemonDetailServiceLocator = PokemonDetailServiceLocator(
      serviceLocator,
    );
    pokemonDetailServiceLocator.setup();
  }
}
