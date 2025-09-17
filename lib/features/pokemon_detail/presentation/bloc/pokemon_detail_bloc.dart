import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokelite/core/state/remote_state.dart';
import 'package:flutter_pokelite/core/state/ui_state.dart';
import 'package:flutter_pokelite/features/pokemon_detail/domain/usecase/pokemon_detail_usecase.dart';
import 'package:flutter_pokelite/features/pokemon_detail/presentation/bloc/pokemon_detail_event.dart';
import 'package:flutter_pokelite/features/pokemon_detail/presentation/bloc/pokemon_detail_state.dart';

class PokemonDetailBloc extends Bloc<PokemonDetailEvent, PokemonDetailState> {
  final PokemonDetailUsecase pokemonDetailUsecase;
  PokemonDetailBloc({required this.pokemonDetailUsecase})
    : super(PokemonDetailState(state: UiStateNone(), pokemonId: 0)) {
    on<FetchPokemonDetail>((event, emit) async {
      if (state.state! is UiStateLoading) {
        return;
      }

      emit(
        PokemonDetailState(state: UiStateLoading(), pokemonId: state.pokemonId),
      );

      final result = await pokemonDetailUsecase.getPokemonDetail(
        event.pokemonId,
      );

      switch (result) {
        case RemoteStateError(error: var message):
          emit(PokemonDetailState(state: UiStateError(message)));
        case RemoteStateSuccess(data: var data):
          emit(PokemonDetailState(state: UiStateSuccess(data)));
        default:
          emit(PokemonDetailState(state: UiStateNone()));
      }
    });
  }
}
