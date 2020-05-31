import 'dart:ffi';

import 'package:lodjinha/src/models/CategoryModel.dart';

class MostSoldProductsResponse {
  List<MostSoldProductsModel> _data = [];

  MostSoldProductsResponse.fromJson(Map<String, dynamic> parsedJson) {
    List<MostSoldProductsModel> _temp = [];
    for(int i = 0; i<parsedJson["data"].length; i++){
      MostSoldProductsModel mostSoldProductsModel = MostSoldProductsModel(parsedJson["data"][i]);
      _temp.add(mostSoldProductsModel);
    }
    _data = _temp;
  }

  List<MostSoldProductsModel> get data => _data;
}

class MostSoldProductsModel {
  CategoryModel _categoryModel;
  String _description;
  int _id;
  String _name;
  double _previousPrice;
  double _currentPrice;
  String _imageUrl;

  MostSoldProductsModel(parsedJson) {
    _description = parsedJson["descricao"];
    _id = parsedJson["id"];
    _name = parsedJson["nome"];
    _previousPrice = parsedJson["precoDe"].toDouble();
    _currentPrice = parsedJson["precoPor"].toDouble();
    _imageUrl = parsedJson["urlImagem"];
    _categoryModel = CategoryModel(parsedJson["categoria"]);
  }

  String get description => _description;

  int get id => _id;

  String get productName => _name;

  double get previousPrice => _previousPrice;

  double get currentPrice => _currentPrice;

  String get imageUrl => _imageUrl;

  CategoryModel get categoryModel => _categoryModel;
}
