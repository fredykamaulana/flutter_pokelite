import 'package:flutter/material.dart';
import 'package:flutter_pokelite/features/pokemon_list/domain/entities/pokemon_entity.dart';

class PokemonItemInfo extends StatelessWidget {
  final PokemonEntity pokemon;

  const PokemonItemInfo({super.key, required this.pokemon});

  BoxDecoration _gradientBackground() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        stops: [0.0, 0.7, 0.7],
        colors: [Colors.black, Colors.transparent, Colors.transparent],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _gradientBackground(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pokemon.nameCapitalized(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              '#${pokemon.id().toString().padLeft(3, '0')}',
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white70,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
