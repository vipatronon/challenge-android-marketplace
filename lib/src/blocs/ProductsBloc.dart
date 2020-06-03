import 'package:lodjinha/src/models/BookProductModel.dart';
import 'package:lodjinha/src/models/MostSoldProductsModel.dart';
import 'package:lodjinha/src/models/CategoryProductModel.dart';
import 'package:lodjinha/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class ProductsBloc {
  final _repository = Repository();
  final _mostSoldProductsFetcher = PublishSubject<MostSoldProductsResponse>();
  final _categoryProductsFetcher = PublishSubject<CategoryProductModel>();
  final _productBooker = PublishSubject<BookProductModel>();

  Observable<MostSoldProductsResponse> get mostSoldProducts => _mostSoldProductsFetcher.stream;
  Observable<CategoryProductModel> get categoryProducts => _categoryProductsFetcher.stream;
  Observable<BookProductModel> get bookedProduct => _productBooker.stream;

  fetchMostSoldProducts() async {
    MostSoldProductsResponse mostSoldProductsResponse = await _repository.fetchMostSoldProducts();
    _mostSoldProductsFetcher.sink.add(mostSoldProductsResponse);
  }

  fetchCategoryProducts(int categoryId, int offset, int limit) async {
    CategoryProductModel productCategoryModel = await _repository.fetchCategoryProducts(categoryId, offset, limit);
    _categoryProductsFetcher.sink.add(productCategoryModel);
  }

  bookProduct(int productId) async {
    BookProductModel productModel = await _repository.bookProduct(productId);
    _productBooker.sink.add(productModel);
  }

  dispose(){
    _mostSoldProductsFetcher.close();
    _categoryProductsFetcher.close();
    _productBooker.close();
  }
}

final productsBloc = ProductsBloc();