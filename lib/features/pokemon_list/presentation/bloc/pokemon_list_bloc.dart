import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokelite/core/state/remote_state.dart';
import 'package:flutter_pokelite/features/pokemon_list/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokelite/features/pokemon_list/domain/usecase/get_pokemon_list_usecase.dart';
import 'package:flutter_pokelite/features/pokemon_list/presentation/bloc/pokemon_list_event.dart';
import 'package:flutter_pokelite/features/pokemon_list/presentation/bloc/pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  GetPokemonListUsecase getPokemonListUsecase;

  PokemonListBloc({required this.getPokemonListUsecase})
    : super(
        PokemonListState(
          state: RemoteStateNone(),
          pokemonList: [],
          pageCount: 0,
        ),
      ) {
    on<FetchPokemons>((event, emit) async {
      if (state.state! is RemoteStateLoading) {
        return;
      }

      state.state = RemoteStateLoading();

      final result = await getPokemonListUsecase.getPokemonList(
        state.pageCount!,
      );

      switch (result) {
        case RemoteStateLoading():
          emit(PokemonListState(state: RemoteStateLoading()));
        case RemoteStateError(error: var message):
          emit(PokemonListState(state: RemoteStateError(message)));
        case RemoteStateSuccess(data: var data):
          final updatedList = List<PokemonEntity>.of(state.pokemonList!)
            ..addAll(data);
          emit(
            PokemonListState(
              state: RemoteStateSuccess(updatedList),
              pokemonList: updatedList,
              pageCount: state.pageCount! + 1,
            ),
          );
        default:
          emit(
            PokemonListState(
              state: RemoteStateNone(),
              pokemonList: state.pokemonList,
              pageCount: state.pageCount,
            ),
          );
      }
    });
  }
}
