import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokelite/core/injections/service_locator.dart';
import 'package:flutter_pokelite/features/pokemon_detail/presentation/bloc/pokemon_detail_bloc.dart';
import 'package:flutter_pokelite/features/pokemon_detail/presentation/screens/pokemon_detail_screen.dart';
import 'package:flutter_pokelite/features/pokemon_list/presentation/bloc/pokemon_list_bloc.dart';
import 'package:flutter_pokelite/features/pokemon_list/presentation/screens/pokemon_list_screen.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ServiceLocator sl = ServiceLocator();
  await sl.setup();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              serviceLocator<PokemonListBloc>(instanceName: 'PokemonListBloc'),
        ),
        BlocProvider(
          create: (_) => serviceLocator<PokemonDetailBloc>(
            instanceName: 'PokemonDetailBloc',
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

final GoRouter _goRouter = GoRouter(
  initialLocation: '/list',
  routes: [
    GoRoute(
      path: '/list',
      name: 'Pokemon List',
      builder: (context, state) => PokemonListScreen(),
    ),
    GoRoute(
      path: '/detail/:id',
      name: 'Pokemon Detail',
      builder: (context, state) {
        final int id = int.parse(state.pathParameters['id']!);
        return PokemonDetailScreen(pokemonId: id);
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pokelite',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      routerConfig: _goRouter,
    );
  }
}
