import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lodjinha/src/blocs/ProductsBloc.dart';
import 'package:lodjinha/src/models/CategoryModel.dart';
import 'package:lodjinha/src/models/CategoryProductModel.dart';
import 'package:lodjinha/src/models/MostSoldProductsModel.dart';
import 'package:lodjinha/src/ui/common/ThinProductCard.dart';
import 'package:lodjinha/src/utils/Strings.dart';

class CategoryDetails extends StatefulWidget {
  final CategoryModel categoryModel;

  const CategoryDetails({Key key, this.categoryModel}) : super(key: key);

  @override
  _CategoryDetailsState createState() => _CategoryDetailsState(categoryModel);
}

class _CategoryDetailsState extends State<CategoryDetails>
    with AutomaticKeepAliveClientMixin<CategoryDetails> {
  CategoryModel categoryModel;
  ScrollController scrollController;
  List<ProductModel> products = [];
  int offset = 0;
  int limit = 20;
  int total;
  bool isLoading = false;

  _CategoryDetailsState(this.categoryModel);

  @override
  void initState() {
    scrollController = ScrollController()
      ..addListener(() {
        scrollListener();
      });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    productsBloc.fetchCategoryProducts(categoryModel.id, offset, limit);
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryModel.description),
      ),
      body: Column(
        children: <Widget>[
          StreamBuilder(
            stream: productsBloc.categoryProducts,
            builder: (context, AsyncSnapshot<CategoryProductModel> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.data.length > 0 || products.length > 0) {
                  total = snapshot.data.total;
                  offset += limit;
                  products.addAll(snapshot.data.data);
                  isLoading = false;
                  return buildProducts(snapshot.data);
                } else {
                  return Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'images/filter.png',
                            scale: 5,
                          ),
                          Text(Strings.categoryDetailsNoneProduct),
                        ],
                      ),
                    ),
                  );
                }
              } else {
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget buildProducts(CategoryProductModel categoryProductModel) {
    return Expanded(
      child: ListView.builder(
        itemCount: products.length,
        controller: scrollController,
        itemBuilder: (BuildContext context, int index) {
          ProductModel productModel = products[index];
          return ThinProductCard(productsModel: productModel);
        },
      ),
    );
  }

  void scrollListener() {
    if (products.length >= total && isLoading) return;

    print(scrollController.position.extentAfter);
    if (scrollController.position.extentAfter <= 200 && !isLoading) {
      isLoading = true;
      productsBloc.fetchCategoryProducts(categoryModel.id, offset, limit);
    }
  }

  @override
  bool get wantKeepAlive => true;
}
