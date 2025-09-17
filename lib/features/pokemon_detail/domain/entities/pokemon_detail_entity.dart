import 'dart:math';

import 'package:flutter/material.dart';

class PokemonDetailEntity {
  int baseExperience;
  int height;
  int id;
  String name;
  List<Stats> stats;
  List<Types> types;
  int weight;

  final Map<String, Color> typeColors = {
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

  static const MAX_HP = 300;
  static const MAX_ATTACK = 200;
  static const MAX_DEFENSE = 200;
  static const MAX_SPEED = 200;
  static const MAX_EXP = 10000;

  final random = Random();
  int get exp => random.nextInt(MAX_EXP);

  PokemonDetailEntity({
    required this.baseExperience,
    required this.height,
    required this.id,
    required this.name,
    required this.stats,
    required this.types,
    required this.weight,
  });

  int get hp => stats.firstWhere((stat) => stat.stat.name == 'hp').baseStat;
  int get attack =>
      stats.firstWhere((stat) => stat.stat.name == 'attack').baseStat;
  int get defense =>
      stats.firstWhere((stat) => stat.stat.name == 'defense').baseStat;
  int get speed =>
      stats.firstWhere((stat) => stat.stat.name == 'speed').baseStat;

  String getHeightString() => '${(height / 10).toStringAsFixed(1)} M';
  String getWeightString() => '${(weight / 10).toStringAsFixed(1)} kG';

  String getHpString() => "$hp/$MAX_HP";
  String getAttackString() => "$attack/$MAX_ATTACK";
  String getDefenseString() => "$defense/$MAX_DEFENSE";
  String getSpeedString() => "$speed/$MAX_SPEED";
  String getExpString() => "$exp/$MAX_EXP";

  String nameCapitalized() {
    if (name.isEmpty) return name;
    return name[0].toUpperCase() + name.substring(1);
  }

  String typeCapitalized() {
    final typeName = types.first.type.name;
    if (typeName.isEmpty) return '';
    return typeName[0].toUpperCase() + typeName.substring(1);
  }

  Color color() {
    final filteredMap = typeColors.entries
        .where((entry) => entry.key.toLowerCase() == types.first.type.name)
        .toList();
    return filteredMap.isNotEmpty
        ? filteredMap.first.value
        : Colors.grey.shade400;
  }
}

class Stats {
  int baseStat;
  int effort;
  Base stat;

  Stats({required this.baseStat, required this.effort, required this.stat});

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
    baseStat: json["base_stat"],
    effort: json["effort"],
    stat: Base.fromJson(json["stat"]),
  );

  Map<String, dynamic> toJson() => {
    "base_stat": baseStat,
    "effort": effort,
    "stat": stat.toJson(),
  };
}

class Types {
  int slot;
  Base type;

  Types({required this.slot, required this.type});

  factory Types.fromJson(Map<String, dynamic> json) =>
      Types(slot: json["slot"], type: Base.fromJson(json["type"]));

  Map<String, dynamic> toJson() => {"slot": slot, "type": type.toJson()};
}

class Base {
  String name;
  String url;

  Base({required this.name, required this.url});

  factory Base.fromJson(Map<String, dynamic> json) =>
      Base(name: json["name"], url: json["url"]);

  Map<String, dynamic> toJson() => {"name": name, "url": url};
}
