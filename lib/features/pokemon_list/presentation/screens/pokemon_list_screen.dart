import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokelite/core/state/remote_state.dart';
import 'package:flutter_pokelite/features/pokemon_list/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokelite/features/pokemon_list/presentation/bloc/pokemon_list_bloc.dart';
import 'package:flutter_pokelite/features/pokemon_list/presentation/bloc/pokemon_list_event.dart';
import 'package:flutter_pokelite/features/pokemon_list/presentation/bloc/pokemon_list_state.dart';
import 'package:flutter_pokelite/features/pokemon_list/presentation/widgets/pokemon_item_card.dart';
import 'dart:developer' as dev;

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_loadMoreMovies);
    context.read<PokemonListBloc>().add(FetchPokemons());
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMoreMovies() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      dev.log('Loading more pokemons...');
      context.read<PokemonListBloc>().add(FetchPokemons());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          int currentCrossAxisCount = 2; // Default value
          if (constraints.maxWidth > 400) {
            currentCrossAxisCount = constraints.maxWidth ~/ 200;
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pokelite',
                          style: Theme.of(context).textTheme.headlineLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Known your favorite pokemon',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: const SizedBox(height: 16)),
                SliverToBoxAdapter(
                  child:
                      BlocSelector<
                        PokemonListBloc,
                        PokemonListState,
                        List<PokemonEntity>
                      >(
                        selector: (state) => state.pokemonList!,
                        builder: (context, pokemonList) => GridView.builder(
                          shrinkWrap: true, // Important for nested scrollables
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: currentCrossAxisCount,
                                mainAxisSpacing: 8.0,
                                crossAxisSpacing: 8.0,
                                //childAspectRatio:0.7,
                              ),
                          itemCount: pokemonList.length,
                          itemBuilder: (context, index) {
                            return PokemonItemCard(pokemon: pokemonList[index]);
                          },
                        ),
                      ),
                ),
                SliverToBoxAdapter(child: const SizedBox(height: 16)),
                SliverToBoxAdapter(
                  child:
                      BlocSelector<
                        PokemonListBloc,
                        PokemonListState,
                        RemoteState
                      >(
                        selector: (state) => state.state!,
                        builder: (context, state) {
                          dev.log('Current state: $state');
                          return switch (state) {
                            RemoteStateLoading() => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            RemoteStateError(error: var error) => Center(
                              child: Text("Error loading movies: $error"),
                            ),
                            _ => const SizedBox.shrink(),
                          };
                        },
                      ),
                ),
                SliverToBoxAdapter(child: const SizedBox(height: 16)),
              ],
            ),
          );
        },
      ),
    );
  }
}
