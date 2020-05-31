import 'package:flutter/material.dart';
import 'package:lodjinha/src/models/CategoryModel.dart';

class CategoryHomeCard extends StatelessWidget {
  CategoryHomeCard(this.categoryModel);

  CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 2,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
                child: Image.network(categoryModel.imageUrl)),
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
}


