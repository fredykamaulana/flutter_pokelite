import 'package:flutter/material.dart';

class PokemonEntity {
  String name;
  String url;

  final Map<String, Color> types = {
    "Grass": Colors.green.shade600,
    "Poison": Colors.purple.shade600,
    "Fire": Colors.red.shade600,
    "Flying": Colors.indigo.shade200,
    "Water": Colors.blue.shade600,
    "Bug": Colors.green.shade300,
    "Normal": Colors.grey.shade600,
    "Electric": Colors.yellow.shade600,
    "Ground": Colors.brown.shade600,
    "Fairy": Colors.pink.shade300,
    "Fighting": Colors.orange.shade600,
    "Psychic": Colors.pink.shade600,
    "Rock": Colors.grey.shade800,
    "Steel": Colors.blueGrey.shade600,
    "Ice": Colors.cyan.shade200,
    "Ghost": Colors.indigo.shade600,
    "Dragon": Colors.teal.shade800,
    "Dark": Colors.grey.shade900,
    "Unknown": Colors.white,
    "Stellar": Colors.amber.shade600,
  };

  PokemonEntity({required this.name, required this.url});

  factory PokemonEntity.fromJson(Map<String, dynamic> json) =>
      PokemonEntity(name: json["name"], url: json["url"]);

  Map<String, dynamic> toJson() => {"name": name, "url": url};

  String nameCapitalized() {
    if (name.isEmpty) return name;
    return name[0].toUpperCase() + name.substring(1);
  }

  int id() {
    return int.parse(url.split('/')[url.split('/').length - 2]);
  }

  String imageUrl() {
    final id = url.split('/')[url.split('/').length - 2];
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
  }

  Color color() {
    final filteredMap = types.entries
        .where((entry) => entry.key.toLowerCase() == entry.key.toLowerCase())
        .toList();
    return filteredMap.isNotEmpty
        ? filteredMap.first.value
        : Colors.grey.shade400;
  }
}
