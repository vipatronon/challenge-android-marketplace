import 'package:flutter/material.dart';
import 'package:lodjinha/src/blocs/CategoriesBloc.dart';
import 'package:lodjinha/src/blocs/ProductsBloc.dart';
import 'package:lodjinha/src/models/CategoryModel.dart';
import 'package:lodjinha/src/models/MostSoldProductsModel.dart';
import 'package:lodjinha/src/ui/common/ThinProductCard.dart';
import 'CategoryHomeCard.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    categoriesBloc.fetchAllCategories();
    productsBloc.fetchMostSoldProducts();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'a Lodjinha',
          style: TextStyle(fontFamily: 'Pacifico'),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                //Banner
                AspectRatio(
                  aspectRatio: 4 / 1.8,
                  child: Container(
                    color: Colors.amber,
                  ),
                ),

                //Titulo Categorias
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Categorias',
                    style: TextStyle(
                        color: Color(0xFF2D3142),
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.normal,
                        fontSize: 17),
                  ),
                ),

                //Carrossel
                AspectRatio(
                  aspectRatio: 4 / 1.2,
                  child: StreamBuilder(
                    stream: categoriesBloc.allCategories,
                    builder:
                        (context, AsyncSnapshot<CategoryResponse> snapshot) {
                      if (snapshot.hasData) {
                        return buildCategory(snapshot);
                      } else {
                        return Text(snapshot.error.toString());
                      }
                    },
                  ),
                ),

                //Titulo Mais vendidos
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Mais Vendidos',
                    style: TextStyle(
                        color: Color(0xFF2D3142),
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.normal,
                        fontSize: 17),
                  ),
                ),

                //Lista
                StreamBuilder(
                  stream: productsBloc.mostSoldProducts,
                  builder: (context,
                      AsyncSnapshot<MostSoldProductsResponse> snapshot) {
                    if (snapshot.hasData) {
                      return buildMostBuildProducts(snapshot);
                    } else {
                      return Text(snapshot.error.toString());
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategory(AsyncSnapshot<CategoryResponse> snapshot) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      addAutomaticKeepAlives: true,

      itemCount: snapshot.data.data.length,
      itemBuilder: (BuildContext content, int index) {
        CategoryModel categoryModel = snapshot.data.data[index];
        return CategoryHomeCard(categoryModel: categoryModel);
      },
    );
  }

  Widget buildMostBuildProducts(AsyncSnapshot<MostSoldProductsResponse> snapshot) {
    return Flexible(
        child: ListView.builder(
          addAutomaticKeepAlives: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: snapshot.data.data.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
          MostSoldProductsModel mostSoldProductsModel = snapshot.data.data[index];
          return ThinProductCard(mostSoldProductsModel: mostSoldProductsModel);
      },
    ));
  }
}
