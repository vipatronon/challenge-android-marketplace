import 'package:lodjinha/src/models/CategoryModel.dart';
import 'package:lodjinha/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class CategoriesBloc {
  final _repository = Repository();
  final _categoriesFetcher = PublishSubject<CategoryResponse>();

  Observable<CategoryResponse> get allCategories => _categoriesFetcher.stream;

  fetchAllCategories() async {
    CategoryResponse categoryResponse = await _repository.fetchAllCategories();
    _categoriesFetcher.sink.add(categoryResponse);
  }

  dispose() {
    _categoriesFetcher.close();
  }
}

final categoriesBloc = CategoriesBloc();
