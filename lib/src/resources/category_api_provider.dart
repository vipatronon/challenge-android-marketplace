import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:lodjinha/src/models/CategoryModel.dart';

class CategoryApiProvider {
  Client client = Client();

  Future<CategoryResponse> fetchAllCategories() async {
    final response = await client.get("https://alodjinha.herokuapp.com/categoria");
    if(response.statusCode == 200){
      return CategoryResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load api");
    }
  }
}