import 'package:lodjinha/src/models/BannerModel.dart';
import 'package:lodjinha/src/models/CategoryModel.dart';
import 'package:lodjinha/src/models/MostSoldProductsModel.dart';
import 'package:lodjinha/src/models/CategoryProductModel.dart';
import 'package:lodjinha/src/models/BookProductModel.dart';
import 'package:lodjinha/src/resources/banner_api_provider.dart';
import 'package:lodjinha/src/resources/category_api_provider.dart';
import 'package:lodjinha/src/resources/product_api_provider.dart';

class Repository {
  final categoryApiProvider = CategoryApiProvider();
  final productsApiProvider = ProductApiProvider();
  final bannerApiProvider = BannerApiProvider();

  Future<CategoryResponse> fetchAllCategories() => categoryApiProvider.fetchAllCategories();
  Future<MostSoldProductsResponse> fetchMostSoldProducts() => productsApiProvider.fetchMostSoldProduts();
  Future<BannerResponse> fetchBanners() => bannerApiProvider.fetchBanners();
  Future<CategoryProductModel> fetchCategoryProducts(int categoryId, int offset, int limit) => productsApiProvider.fetchCategoryProducts(categoryId, offset, limit);
  Future<BookProductModel> bookProduct(int productId) => productsApiProvider.bookProduct(productId);
}