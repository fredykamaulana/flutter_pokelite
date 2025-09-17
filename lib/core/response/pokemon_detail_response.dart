// To parse this JSON data, do
//
// final pokemonDetailResponse = pokemonDetailResponseFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_pokelite/features/pokemon_detail/data/models/pokemon_detail_model.dart';

PokemonDetailResponse pokemonDetailResponseFromJson(String str) =>
    PokemonDetailResponse.fromJson(json.decode(str));

String pokemonDetailResponseToJson(PokemonDetailResponse data) =>
    json.encode(data.toJson());

class PokemonDetailResponse {
  List<Ability>? abilities;
  Cries? cries;
  List<Species>? forms;
  bool? isDefault;
  String? locationAreaEncounters;
  int? order;
  List<PastAbility>? pastAbilities;
  List<dynamic>? pastTypes;
  Species? species;
  PokemonDetailModel? detailModel;

  PokemonDetailResponse({
    required this.abilities,
    required this.cries,
    required this.forms,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.order,
    required this.pastAbilities,
    required this.pastTypes,
    required this.species,
    required this.detailModel,
  });

  factory PokemonDetailResponse.fromJson(Map<String, dynamic> json) =>
      PokemonDetailResponse(
        abilities: List<Ability>.from(
          json["abilities"].map((x) => Ability.fromJson(x)),
        ),
        cries: Cries.fromJson(json["cries"]),
        forms: List<Species>.from(
          json["forms"].map((x) => Species.fromJson(x)),
        ),
        isDefault: json["is_default"],
        locationAreaEncounters: json["location_area_encounters"],
        order: json["order"],
        pastAbilities: List<PastAbility>.from(
          json["past_abilities"].map((x) => PastAbility.fromJson(x)),
        ),
        pastTypes: List<dynamic>.from(json["past_types"].map((x) => x)),
        species: Species.fromJson(json["species"]),
        detailModel: PokemonDetailModel.fromJson(json),
      );

  Map<String, dynamic> toJson() => {
    "abilities": List<dynamic>.from(abilities?.map((x) => x.toJson()) ?? []),
    "base_experience": detailModel?.baseExperience,
    "cries": cries?.toJson(),
    "forms": List<dynamic>.from(forms?.map((x) => x.toJson()) ?? []),
    "height": detailModel?.height,
    "id": detailModel?.id,
    "is_default": isDefault,
    "location_area_encounters": locationAreaEncounters,
    "name": detailModel?.name,
    "order": order,
    "past_abilities": List<dynamic>.from(
      pastAbilities?.map((x) => x.toJson()) ?? [],
    ),
    "past_types": List<dynamic>.from(pastTypes?.map((x) => x) ?? []),
    "species": species?.toJson(),
    "stats": List<dynamic>.from(
      detailModel?.stats.map((x) => x.toJson()) ?? [],
    ),
    "types": List<dynamic>.from(
      detailModel?.types.map((x) => x.toJson()) ?? [],
    ),
    "weight": detailModel?.weight,
  };
}

class Ability {
  Species? ability;
  bool isHidden;
  int slot;

  Ability({required this.ability, required this.isHidden, required this.slot});

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
    ability: json["ability"] == null ? null : Species.fromJson(json["ability"]),
    isHidden: json["is_hidden"],
    slot: json["slot"],
  );

  Map<String, dynamic> toJson() => {
    "ability": ability?.toJson(),
    "is_hidden": isHidden,
    "slot": slot,
  };
}

class Species {
  String name;
  String url;

  Species({required this.name, required this.url});

  factory Species.fromJson(Map<String, dynamic> json) =>
      Species(name: json["name"], url: json["url"]);

  Map<String, dynamic> toJson() => {"name": name, "url": url};
}

class Cries {
  String latest;
  String legacy;

  Cries({required this.latest, required this.legacy});

  factory Cries.fromJson(Map<String, dynamic> json) =>
      Cries(latest: json["latest"], legacy: json["legacy"]);

  Map<String, dynamic> toJson() => {"latest": latest, "legacy": legacy};
}

class PastAbility {
  List<Ability> abilities;
  Species generation;

  PastAbility({required this.abilities, required this.generation});

  factory PastAbility.fromJson(Map<String, dynamic> json) => PastAbility(
    abilities: List<Ability>.from(
      json["abilities"].map((x) => Ability.fromJson(x)),
    ),
    generation: Species.fromJson(json["generation"]),
  );

  Map<String, dynamic> toJson() => {
    "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
    "generation": generation.toJson(),
  };
}

class Stat {
  int baseStat;
  int effort;
  Species stat;

  Stat({required this.baseStat, required this.effort, required this.stat});

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
    baseStat: json["base_stat"],
    effort: json["effort"],
    stat: Species.fromJson(json["stat"]),
  );

  Map<String, dynamic> toJson() => {
    "base_stat": baseStat,
    "effort": effort,
    "stat": stat.toJson(),
  };
}

class Type {
  int slot;
  Species type;

  Type({required this.slot, required this.type});

  factory Type.fromJson(Map<String, dynamic> json) =>
      Type(slot: json["slot"], type: Species.fromJson(json["type"]));

  Map<String, dynamic> toJson() => {"slot": slot, "type": type.toJson()};
}
