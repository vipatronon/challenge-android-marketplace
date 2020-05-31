import 'package:lodjinha/src/models/CategoryModel.dart';
import 'package:lodjinha/src/models/MostSoldProductsModel.dart';
import 'package:lodjinha/src/resources/category_api_provider.dart';
import 'package:lodjinha/src/resources/product_api_provider.dart';

class Repository {
  final categoryApiProvider = CategoryApiProvider();
  final productsApiProvider = ProductApiProvider();

  Future<CategoryResponse> fetchAllCategories() => categoryApiProvider.fetchAllCategories();
  Future<MostSoldProductsResponse> fetchMostSoldProducts() => productsApiProvider.fetchMostSoldProduts();
}