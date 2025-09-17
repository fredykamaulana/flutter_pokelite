import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokelite/core/state/ui_state.dart';
import 'package:flutter_pokelite/features/pokemon_detail/presentation/bloc/pokemon_detail_bloc.dart';
import 'package:flutter_pokelite/features/pokemon_detail/presentation/bloc/pokemon_detail_event.dart';
import 'package:flutter_pokelite/features/pokemon_detail/presentation/bloc/pokemon_detail_state.dart';
import 'package:flutter_pokelite/features/pokemon_detail/presentation/screens/pokemon_detail_content.dart';

class PokemonDetailScreen extends StatefulWidget {
  final int pokemonId;

  const PokemonDetailScreen({super.key, required this.pokemonId});

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  void initState() {
    context.read<PokemonDetailBloc>().add(
      FetchPokemonDetail(pokemonId: widget.pokemonId),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailBloc, PokemonDetailState>(
      builder: (context, state) {
        return switch (state.state!) {
          UiStateLoading() => Center(child: CircularProgressIndicator()),
          UiStateError(error: var error) => Center(child: Text(error)),
          UiStateSuccess(data: var data) => PokemonDetailContent(detail: data),
          _ => Center(child: CircularProgressIndicator()),
        };
      },
    );
  }
}
