import 'package:flutter_pokelite/features/pokemon_detail/domain/entities/pokemon_detail_entity.dart';

class PokemonDetailModel extends PokemonDetailEntity {
  PokemonDetailModel({
    required super.baseExperience,
    required super.height,
    required super.id,
    required super.name,
    required super.stats,
    required super.types,
    required super.weight,
  });

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) {
    return PokemonDetailModel(
      baseExperience: json['base_experience'],
      height: json['height'],
      id: json['id'],
      name: json['name'],
      stats: (json['stats'] as List)
          .map((stat) => Stats.fromJson(stat))
          .toList(),
      types: (json['types'] as List)
          .map((type) => Types.fromJson(type))
          .toList(),
      weight: json['weight'],
    );
  }

  Map<String, dynamic> toJson() => {
    'base_experience': baseExperience,
    'height': height,
    'id': id,
    'name': name,
    'stats': stats.map((stat) => stat.toJson()).toList(),
    'types': types.map((type) => type.toJson()).toList(),
    'weight': weight,
  };
}
