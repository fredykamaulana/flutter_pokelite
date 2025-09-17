import 'package:dio/dio.dart';
import 'package:flutter_pokelite/core/network/dio_api_client.dart';
import 'package:flutter_pokelite/core/response/pokemon_detail_response.dart';
import 'package:flutter_pokelite/core/response/pokemon_list_response.dart';
import 'package:flutter_pokelite/core/state/remote_state.dart';

class PokemonService {
  final serviceName = "pokemon";

  Future<RemoteState> getPokemonList({int limit = 10, int offset = 0}) async {
    try {
      final response = await DioApiClient().dio.get(
        '$serviceName?limit=$limit&offset=$offset',
      );

      final pokemonListResponse = PokemonListResponse.fromJson(response.data);

      return RemoteStateSuccess(pokemonListResponse.results);
    } on DioException catch (e) {
      return RemoteStateError(e.message ?? "Something went wrong");
    } catch (e) {
      return RemoteStateError(e.toString());
    }
  }

  Future<RemoteState> getPokemonDetail({required int id}) async {
    try {
      final response = await DioApiClient().dio.get('$serviceName/$id');

      final pokemondetailResponse = PokemonDetailResponse.fromJson(
        response.data,
      );

      return RemoteStateSuccess(pokemondetailResponse.detailModel);
    } on DioException catch (e) {
      return RemoteStateError(e.message ?? "Something went wrong");
    } catch (e) {
      return RemoteStateError(e.toString());
    }
  }
}
