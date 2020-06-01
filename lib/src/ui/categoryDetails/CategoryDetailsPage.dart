import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lodjinha/src/blocs/ProductsBloc.dart';
import 'package:lodjinha/src/models/CategoryModel.dart';
import 'package:lodjinha/src/models/CategoryProductModel.dart';
import 'package:lodjinha/src/models/MostSoldProductsModel.dart';
import 'package:lodjinha/src/ui/common/ThinProductCard.dart';

class CategoryDetails extends StatefulWidget {
  final CategoryModel categoryModel;

  const CategoryDetails({Key key, this.categoryModel}) : super(key: key);

  @override
  _CategoryDetailsState createState() => _CategoryDetailsState(categoryModel);
}

class _CategoryDetailsState extends State<CategoryDetails> with AutomaticKeepAliveClientMixin<CategoryDetails> {
  CategoryModel categoryModel;
  List<ProductModel> products = [];

  _CategoryDetailsState(this.categoryModel);

  @override
  Widget build(BuildContext context) {
    productsBloc.fetchCategoryProducts(categoryModel.id, 0, 20);
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryModel.description),
      ),
      body: Column(
        children: <Widget>[
          StreamBuilder(
            stream: productsBloc.categoryProducts,
            builder: (context, AsyncSnapshot<CategoryProductModel> snapshot) {
              if (snapshot.hasData){
                products.addAll(snapshot.data.data);
                return buildProducts(snapshot.data);
              } else {
                return Text(snapshot.error.toString());
              }
            },
          ),
        ],
      ),
    );
  }

  Widget buildProducts(CategoryProductModel categoryProductModel){
    return Expanded(
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          ProductModel productModel = products[index];
          return ThinProductCard(productsModel: productModel);
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
