import 'package:lodjinha/src/models/BannerModel.dart';
import 'package:lodjinha/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class BannersBloc {
  final _repository = Repository();
  final _bannersFetcher = PublishSubject<BannerResponse>();

  Observable<BannerResponse> get allBanners => _bannersFetcher.stream;

  fetchAllBanners() async {
    BannerResponse bannerResponse = await _repository.fetchBanners();
    _bannersFetcher.sink.add(bannerResponse);
  }

  dispose(){
    _bannersFetcher.close();
  }
}

final bannersBloc = BannersBloc();