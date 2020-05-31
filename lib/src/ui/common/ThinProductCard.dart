import 'package:flutter/material.dart';
import 'package:lodjinha/src/models/MostSoldProductsModel.dart';

class ThinProductCard extends StatefulWidget {
  final MostSoldProductsModel mostSoldProductsModel;

  ThinProductCard({Key key, @required this.mostSoldProductsModel}) : super(key: key);

  @override
  _ThinProductCardState createState() => _ThinProductCardState(mostSoldProductsModel);
}

class _ThinProductCardState extends State<ThinProductCard> with AutomaticKeepAliveClientMixin<ThinProductCard> {
  MostSoldProductsModel mostSoldProductsModel;

  _ThinProductCardState(this.mostSoldProductsModel);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 2,
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 2,
              child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Image.network(mostSoldProductsModel.imageUrl)
              )),
          Expanded(
              flex: 7,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      mostSoldProductsModel.productName,
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
                          "De:${mostSoldProductsModel.previousPrice.toString()}",
                          style: TextStyle(
                              color: Color(0xFFAAAAAA),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough
                          ),
                        ),
                        Text(
                          "Por: ${mostSoldProductsModel.currentPrice}",
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
              child: Container(
                //Lugar da setinha
                color: Colors.brown,
              )
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
