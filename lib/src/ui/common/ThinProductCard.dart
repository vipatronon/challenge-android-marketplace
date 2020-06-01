import 'package:flutter/material.dart';
import 'package:lodjinha/src/models/MostSoldProductsModel.dart';

class ThinProductCard extends StatefulWidget {
  final ProductModel productsModel;

  ThinProductCard({Key key, @required this.productsModel}) : super(key: key);

  @override
  _ThinProductCardState createState() => _ThinProductCardState(productsModel);
}

class _ThinProductCardState extends State<ThinProductCard> with AutomaticKeepAliveClientMixin<ThinProductCard> {
  ProductModel productsModel;

  _ThinProductCardState(this.productsModel);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 2,
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 3,
              child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Image.network(productsModel.imageUrl)
              )),
          Expanded(
              flex: 7,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      productsModel.productName,
                      style: TextStyle(
                          color: Color(0xFF2D3142),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 18
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "De:${productsModel.previousPrice.toString()}",
                          style: TextStyle(
                              color: Color(0xFFAAAAAA),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough
                          ),
                        ),
                        Text(
                          "Por: ${productsModel.currentPrice}",
                          style: TextStyle(
                              color: Color(0xFFF15025),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
          ),
          Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(12),
                  child: Image.asset('images/disclosure_indicator.png'),
              ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
