import 'package:flutter/material.dart';
import 'package:lodjinha/src/models/CategoryModel.dart';
import 'package:lodjinha/src/ui/categoryDetails/CategoryDetailsPage.dart';

class CategoryHomeCard extends StatefulWidget {
  final CategoryModel categoryModel;

  CategoryHomeCard({Key key, @required this.categoryModel}) : super(key: key);

  @override
  _CategoryHomeCardState createState() => _CategoryHomeCardState(categoryModel);
}

class _CategoryHomeCardState extends State<CategoryHomeCard>
    with AutomaticKeepAliveClientMixin<CategoryHomeCard> {
  CategoryModel categoryModel;

  _CategoryHomeCardState(this.categoryModel);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 2,
      child: FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryDetails(categoryModel: categoryModel),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(flex: 2, child: Image.network(categoryModel.imageUrl)),
            Expanded(
              flex: 1,
              child: Text(
                categoryModel.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF2D3142),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.normal,
                    fontSize: 13),
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
