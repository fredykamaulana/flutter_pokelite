// To parse this JSON data, do
//
// final pokemonListResponse = pokemonListResponseFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_pokelite/features/pokemon_list/data/models/pokemon_model.dart';

PokemonListResponse pokemonListResponseFromJson(String str) =>
    PokemonListResponse.fromJson(json.decode(str));

String pokemonListResponseToJson(PokemonListResponse data) =>
    json.encode(data.toJson());

class PokemonListResponse {
  int? count;
  String? next;
  String? previous;
  List<PokemonModel>? results;

  PokemonListResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) =>
      PokemonListResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<PokemonModel>.from(
          json["results"].map((x) => PokemonModel.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results?.map((x) => x.toJson()) ?? []),
  };
}
