import 'package:flutter/material.dart';
import 'package:lodjinha/src/models/MostSoldProductsModel.dart';
import 'package:lodjinha/src/ui/common/PreviousProductPrice.dart';
import 'package:lodjinha/src/ui/common/ProductName.dart';
import 'package:lodjinha/src/ui/productDetails/ProductDetailsPage.dart';
import 'CurrentProductPrice.dart';

class ThinProductCard extends StatefulWidget {
  final ProductModel productsModel;

  ThinProductCard({Key key, @required this.productsModel}) : super(key: key);

  @override
  _ThinProductCardState createState() => _ThinProductCardState(productsModel);
}

class _ThinProductCardState extends State<ThinProductCard>
    with AutomaticKeepAliveClientMixin<ThinProductCard> {
  ProductModel productsModel;

  _ThinProductCardState(this.productsModel);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 2,
      child: FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetails(productModel: productsModel,)
            ),
          );
        },
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Image.network(productsModel.imageUrl))),
            Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      productName(productsModel.productName),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            previousProductPrice(productsModel.currentPrice),
                            currentProductPrice(productsModel.previousPrice),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Image.asset('images/disclosure_indicator.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
