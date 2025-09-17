import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokelite/features/pokemon_list/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokelite/features/pokemon_list/presentation/widgets/pokemon_item_info.dart';
import 'package:go_router/go_router.dart';

class PokemonItemCard extends StatelessWidget {
  final PokemonEntity pokemon;

  const PokemonItemCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(),
      borderRadius: BorderRadius.circular(16.0),
      onTap: () {
        context.push('/detail/${pokemon.id()}');
        Navigator.pushNamed(context, '/detail', arguments: pokemon.id);
      },
      child: Card(
        color: Color(
          (math.Random().nextDouble() * 0xFFFFFF).toInt(),
        ).withValues(alpha: 0.7),
        elevation: 4.0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            Hero(
              tag: pokemon.id(),
              child: CachedNetworkImage(
                imageUrl: pokemon.imageUrl(),
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.darken,
              ),
            ),

            PokemonItemInfo(pokemon: pokemon),
          ],
        ),
      ),
    );
  }
}
