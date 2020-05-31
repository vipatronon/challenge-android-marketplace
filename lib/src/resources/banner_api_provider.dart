import 'dart:convert';

import 'package:http/http.dart';
import 'package:lodjinha/src/models/BannerModel.dart';

class BannerApiProvider {
  Client client = Client();
  
  Future<BannerResponse> fetchBanners() async {
    final response = await client.get("https://alodjinha.herokuapp.com/banner");
    print(response.body.toString());
    if (response.statusCode == 200){
      return BannerResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load api");
    }
  }
}