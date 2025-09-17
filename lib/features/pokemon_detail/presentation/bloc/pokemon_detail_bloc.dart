import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokelite/core/state/remote_state.dart';
import 'package:flutter_pokelite/features/pokemon_detail/domain/usecase/pokemon_detail_usecase.dart';
import 'package:flutter_pokelite/features/pokemon_detail/presentation/bloc/pokemon_detail_event.dart';
import 'package:flutter_pokelite/features/pokemon_detail/presentation/bloc/pokemon_detail_state.dart';

class PokemonDetailBloc extends Bloc<PokemonDetailEvent, PokemonDetailState> {
  final PokemonDetailUsecase pokemonDetailUsecase;
  PokemonDetailBloc({required this.pokemonDetailUsecase})
    : super(
        PokemonDetailState(
          state: RemoteStateNone(),
          pokemonId: 0,
          detail: null,
        ),
      ) {
    on<FetchPokemonDetail>((event, emit) async {
      if (state.state! is RemoteStateLoading) {
        return;
      }

      state.state = RemoteStateLoading();

      final result = await pokemonDetailUsecase.getPokemonDetail(
        event.pokemonId,
      );

      switch (result) {
        case RemoteStateLoading():
          emit(PokemonDetailState(state: RemoteStateLoading()));
        case RemoteStateError(error: var message):
          emit(PokemonDetailState(state: RemoteStateError(message)));
        case RemoteStateSuccess(data: var data):
          emit(
            PokemonDetailState(state: RemoteStateSuccess(data), detail: data),
          );
        default:
          emit(
            PokemonDetailState(state: RemoteStateNone(), detail: state.detail),
          );
      }
    });
  }
}
