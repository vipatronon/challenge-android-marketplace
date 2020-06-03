class CategoryResponse {
  List<CategoryModel> _data = [];

  CategoryResponse.fromJson(Map<String, dynamic> parsedJson){
    List<CategoryModel> _temp = [];
    for (int i = 0; i<parsedJson['data'].length; i++) {
      CategoryModel categoryModel = CategoryModel(parsedJson['data'][i]);
      _temp.add(categoryModel);
    }

    _data = _temp;
  }

  List<CategoryModel> get data => _data;
}

class CategoryModel {
  String _description;
  int _id;
  String _imageUrl;

  CategoryModel(parsedJson){
    _description = parsedJson['descricao'];
    _id = parsedJson['id'];
    _imageUrl = parsedJson['urlImagem'];
  }

  String get description => _description;
  int get id => _id;
  String get imageUrl => _imageUrl;
}