import 'package:lodjinha/src/models/MostSoldProductsModel.dart';
import 'package:lodjinha/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class ProductsBloc {
  final _repository = Repository();
  final _mostSoldProductsFetcher = PublishSubject<MostSoldProductsResponse>();

  Observable<MostSoldProductsResponse> get mostSoldProducts => _mostSoldProductsFetcher.stream;

  fetchMostSoldProducts() async {
    MostSoldProductsResponse mostSoldProductsResponse = await _repository.fetchMostSoldProducts();
    _mostSoldProductsFetcher.sink.add(mostSoldProductsResponse);
  }

  dispose(){
    _mostSoldProductsFetcher.close();
  }
}

final productsBloc = ProductsBloc();