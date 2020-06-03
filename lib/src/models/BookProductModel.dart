class BookProductModel {
  String _result;

  BookProductModel.fromJson(Map<String, dynamic> parsedJson){
    _result = parsedJson["result"];
  }

  String get result => _result;
}