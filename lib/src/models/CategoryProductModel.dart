import 'MostSoldProductsModel.dart';

class CategoryProductModel {
  List<ProductModel> _data = [];
  int _offset;
  int _total;

  CategoryProductModel.fromJson(Map<String, dynamic> parsedJson) {
    List<ProductModel> _temp = [];
    for(int i = 0; i<parsedJson["data"].length; i++){
      ProductModel mostSoldProductsModel = ProductModel(parsedJson["data"][i]);
      _temp.add(mostSoldProductsModel);
    }
    _data = _temp;
    _offset = parsedJson["offset"];
    _total = parsedJson["total"];
  }

  List<ProductModel> get data => _data;
  int get offset => _offset;
  int get total => _total;
}
