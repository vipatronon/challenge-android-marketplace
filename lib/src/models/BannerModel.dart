class BannerResponse {
  List<BannerModel> _data = [];

  BannerResponse.fromJson(Map<String, dynamic> parsedJson){
    List<BannerModel> _temp = [];
    for (int i =0; i<parsedJson["data"].length; i++){
      BannerModel bannerModel = BannerModel(parsedJson["data"][i]);
      _temp.add(bannerModel);
    }

    _data = _temp;
  }

  List<BannerModel> get data => _data;
}

class BannerModel {
  int _id;
  String _linkUrl;
  String _imageUrl;

  BannerModel(parsedJson) {
    _id = parsedJson["id"];
    _linkUrl = parsedJson["linkUrl"];
    _imageUrl = parsedJson["urlImagem"];
  }

  int get id => _id;

  String get linkUrl => _linkUrl;

  String get imageUrl => _imageUrl;
}