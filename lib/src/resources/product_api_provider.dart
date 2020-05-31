import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';

import 'package:lodjinha/src/models/MostSoldProductsModel.dart';

class ProductApiProvider {
  Client client = Client();

  Future<MostSoldProductsResponse> fetchMostSoldProduts() async {
    final response = await client.get("https://alodjinha.herokuapp.com/produto/maisvendidos");
    if (response.statusCode == 200){
      print(response.body.toString());
      return MostSoldProductsResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load api");
    }
  }
}