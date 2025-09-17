import 'package:flutter_pokelite/core/service/pokemon_service.dart';
import 'package:flutter_pokelite/features/pokemon_detail/data/datasource/pokemon_detail_datasource.dart';
import 'package:flutter_pokelite/features/pokemon_detail/data/repository/pokemon_detail_repository_impl.dart';
import 'package:flutter_pokelite/features/pokemon_detail/domain/repository/pokemon_detail_repository.dart';
import 'package:flutter_pokelite/features/pokemon_detail/domain/usecase/pokemon_detail_usecase.dart';
import 'package:flutter_pokelite/features/pokemon_detail/presentation/bloc/pokemon_detail_bloc.dart';
import 'package:get_it/get_it.dart';

class PokemonDetailServiceLocator {
  final GetIt serviceLocator;

  PokemonDetailServiceLocator(this.serviceLocator);

  Future<void> setup() async {
    serviceLocator.registerLazySingleton<PokemonDetailDatasource>(
      () => PokemonDetailDatasource(
        service: serviceLocator.get<PokemonService>(
          instanceName: 'PokemonService',
        ),
      ),
      instanceName: 'PokemonDetailDatasource',
    );

    serviceLocator.registerLazySingleton<PokemonDetailRepository>(
      () => PokemonDetailRepositoryImpl(
        serviceLocator.get<PokemonDetailDatasource>(
          instanceName: 'PokemonDetailDatasource',
        ),
      ),
      instanceName: 'PokemonDetailRepository',
    );

    serviceLocator.registerLazySingleton<PokemonDetailUsecase>(
      () => PokemonDetailUsecase(
        repository: serviceLocator.get<PokemonDetailRepository>(
          instanceName: 'PokemonDetailRepository',
        ),
      ),
      instanceName: 'PokemonDetailUsecase',
    );

    serviceLocator.registerLazySingleton<PokemonDetailBloc>(
      () => PokemonDetailBloc(
        pokemonDetailUsecase: serviceLocator.get<PokemonDetailUsecase>(
          instanceName: 'PokemonDetailUsecase',
        ),
      ),
      instanceName: 'PokemonDetailBloc',
    );
  }
}
