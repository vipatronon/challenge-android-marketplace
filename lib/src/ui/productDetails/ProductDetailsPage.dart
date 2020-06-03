import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lodjinha/src/blocs/ProductsBloc.dart';
import 'package:lodjinha/src/models/BookProductModel.dart';
import 'package:lodjinha/src/models/MostSoldProductsModel.dart';
import 'package:lodjinha/src/ui/common/CurrentProductPrice.dart';
import 'package:lodjinha/src/ui/common/PreviousProductPrice.dart';
import 'package:lodjinha/src/ui/common/ProductName.dart';


class ProductDetails extends StatefulWidget {
  final ProductModel productModel;

  const ProductDetails({Key key, this.productModel}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState(productModel);
}

class _ProductDetailsState extends State<ProductDetails> {
  final ProductModel productModel;
  final double horizontalPadding = 20.0;
  final double verticalPadding = 5.0;
  bool isLoading = false;

  _ProductDetailsState(this.productModel);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Expanded(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: horizontalPadding,
                                vertical: verticalPadding),
                            child: AspectRatio(
                              aspectRatio: 5 / 3.5,
                              child: Image.network(productModel.imageUrl),
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: horizontalPadding,
                                vertical: verticalPadding),
                            child: productName(productModel.productName),
                          ),
                          Divider(),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: horizontalPadding,
                                vertical: verticalPadding),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                currentProductPrice(productModel.currentPrice),
                                previousProductPrice(
                                    productModel.previousPrice),
                              ],
                            ),
                          ),
                          Divider(),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: horizontalPadding,
                                  vertical: verticalPadding),
                              child: Text(
                                'Descrição',
                                style: TextStyle(
                                    color: Color(0xFF2D3142),
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: verticalPadding,
                                right: horizontalPadding,
                                left: horizontalPadding,
                                bottom: verticalPadding * 17),
                            child: Html(
                              data: productModel.description,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  StreamBuilder(
                    stream: productsBloc.bookedProduct,
                    builder: (BuildContext context,
                        AsyncSnapshot<BookProductModel> snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data.result == 'success') {
                          WidgetsBinding.instance.addPostFrameCallback((_) =>
                              showMyDialog(context,
                                  'Produto reservado com sucesso', true));
                        } else {
                          WidgetsBinding.instance.addPostFrameCallback((_) =>
                              showMyDialog(context,
                                  'Erro ao reservar o produto', false));
                        }
                        return Container();
                      } else {
                        return Container();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (!isLoading) {
            productsBloc.bookProduct(productModel.id);
            isLoading = true;
          }
        },
        child: Icon(Icons.check),
        backgroundColor: Color(0xFF5E2A84),
      ),
    );
  }
}

Future<void> showMyDialog(
    BuildContext context, String message, bool navigateBack) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Reserva'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Approve'),
            onPressed: () {
              if (navigateBack) {
                Navigator.of(context).pop();
              }
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
