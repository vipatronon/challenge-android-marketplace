import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:lodjinha/src/models/MostSoldProductsModel.dart';
import 'package:lodjinha/src/models/CategoryProductModel.dart';

class ProductApiProvider {
  Client client = Client();

  Future<MostSoldProductsResponse> fetchMostSoldProduts() async {
    final response = await client.get("https://alodjinha.herokuapp.com/produto/maisvendidos");
    if (response.statusCode == 200){
      return MostSoldProductsResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load api");
    }
  }

  Future<CategoryProductModel> fetchCategoryProducts(int categoryId, int offset, int limit) async {
    final response = await client.get("https://alodjinha.herokuapp.com/produto?offset=$offset&limit=$limit&categoriaId=$categoryId");
    print(response.body.toString());
    if (response.statusCode == 200) {
      return CategoryProductModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load api");
    }
  }
}