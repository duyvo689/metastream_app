// ignore_for_file: non_constant_identifier_names, unused_local_variable, unnecessary_new, unnecessary_null_comparison, prefer_const_constructors, no_leading_underscores_for_local_identifiers, unnecessary_brace_in_string_interps

import 'package:app_metastream/models/magicedennft_detail_model.dart';
import 'package:app_metastream/models/models.dart';
import 'package:http/http.dart' as http;
import 'api_url.dart';
import 'dart:convert';

class ApiCollectionServices {
  Future<List<Collection>> fetchListCollection() {
    return http
        .get(Uri.parse('${URL().API_URL}/api/v1/collection/sol'))
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        throw new Exception("Error load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final collectionListContainer = _decoder.convert(jsonBody);
      final List collections = collectionListContainer['data'];
      return collections
          .map((contactRaw) => new Collection.fromJson(contactRaw))
          .toList();
    });
  }

  Future<List<MagicEdenNft>> fetchNftMagicEdenBySymbol(String symbol) {
    return http
        .get(Uri.parse(
            '${URL().API_URL}/api/v1/magicEden/collections/${symbol}/listings'))
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        throw new Exception("Error load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final collectionListContainer = _decoder.convert(jsonBody);
      final List magicEdenNft = collectionListContainer['data'];
      return magicEdenNft
          .map((contactRaw) => new MagicEdenNft.fromJson(contactRaw))
          .toList();
    });
  }

  Future<StatsMagicEden> fetchStatsMagicEdenBySymbol(String symbol) {
    return http
        .get(Uri.parse(
            '${URL().API_URL}/api/v1/magicEden/collections/${symbol}/stats'))
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        throw new Exception("Error load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final statsContainer = _decoder.convert(jsonBody);
      final stats = statsContainer['data'];

      return StatsMagicEden.fromJson(stats);
    });
  }

  Future<MagicEdenNftDetail> fetchTokenListingDataMagicEden(String tokenMint) {
    return http
        .get(Uri.parse('${URL().API_URL}/api/v1/magicEden/tokens/${tokenMint}'))
        .then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200 || jsonBody == null) {
        throw new Exception("Error load api");
      }

      final JsonDecoder _decoder = new JsonDecoder();
      final statsContainer = _decoder.convert(jsonBody);
      final TokenListingData = statsContainer['data'];

      return MagicEdenNftDetail.fromJson(TokenListingData);
    });
  }
}
