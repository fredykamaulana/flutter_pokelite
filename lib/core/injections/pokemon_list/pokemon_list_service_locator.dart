import 'package:flutter_pokelite/core/service/pokemon_service.dart';
import 'package:flutter_pokelite/features/pokemon_list/data/datasource/pokemon_list_datasource.dart';
import 'package:flutter_pokelite/features/pokemon_list/data/repository/pokemon_list_repository_impl.dart';
import 'package:flutter_pokelite/features/pokemon_list/domain/repository/pokemon_list_repository.dart';
import 'package:flutter_pokelite/features/pokemon_list/domain/usecase/get_pokemon_list_usecase.dart';
import 'package:flutter_pokelite/features/pokemon_list/presentation/bloc/pokemon_list_bloc.dart';
import 'package:get_it/get_it.dart';

class PokemonListServiceLocator {
  final GetIt serviceLocator;

  PokemonListServiceLocator(this.serviceLocator);

  Future<void> setup() async {
    serviceLocator.registerLazySingleton<PokemonListDatasource>(
      () => PokemonListDatasource(
        service: serviceLocator.get<PokemonService>(
          instanceName: 'PokemonService',
        ),
      ),
      instanceName: 'PokemonListDatasource',
    );

    serviceLocator.registerLazySingleton<PokemonListRepository>(
      () => PokemonListRepositoryImpl(
        serviceLocator.get<PokemonListDatasource>(
          instanceName: 'PokemonListDatasource',
        ),
      ),
      instanceName: 'PokemonListRepository',
    );

    serviceLocator.registerLazySingleton<GetPokemonListUsecase>(
      () => GetPokemonListUsecase(
        repository: serviceLocator.get<PokemonListRepository>(
          instanceName: 'PokemonListRepository',
        ),
      ),
      instanceName: 'GetPokemonListUsecase',
    );

    serviceLocator.registerLazySingleton(
      () => PokemonListBloc(
        getPokemonListUsecase: serviceLocator.get<GetPokemonListUsecase>(
          instanceName: 'GetPokemonListUsecase',
        ),
      ),
      instanceName: 'PokemonListBloc',
    );
  }
}
