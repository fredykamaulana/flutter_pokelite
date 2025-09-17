import 'package:flutter_pokelite/features/pokemon_list/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  PokemonModel({required super.name, required super.url});

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(name: json['name'], url: json['url']);
  }

  @override
  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}
