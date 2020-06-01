import 'package:flutter/material.dart';
import 'package:lodjinha/src/blocs/BannersBloc.dart';
import 'package:lodjinha/src/blocs/CategoriesBloc.dart';
import 'package:lodjinha/src/blocs/ProductsBloc.dart';
import 'package:lodjinha/src/models/BannerModel.dart';
import 'package:lodjinha/src/models/CategoryModel.dart';
import 'package:lodjinha/src/models/MostSoldProductsModel.dart';
import 'package:lodjinha/src/ui/common/ThinProductCard.dart';
import 'CategoryHomeCard.dart';
import 'CustomCarousel.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    categoriesBloc.fetchAllCategories();
    productsBloc.fetchMostSoldProducts();
    bannersBloc.fetchAllBanners();
    return Scaffold(
      appBar: homeAppBar(),
      drawer: appDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                AspectRatio(
                  aspectRatio: 4 / 1.8,
                  child: StreamBuilder(
                    stream: bannersBloc.allBanners,
                    builder: (context, AsyncSnapshot<BannerResponse> snapshot) {
                      if (snapshot.hasData) {
                        return buildCarousel(snapshot);
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
                homeCategory('Categorias'),
                AspectRatio(
                  aspectRatio: 4 / 1.2,
                  child: StreamBuilder(
                    stream: categoriesBloc.allCategories,
                    builder:
                        (context, AsyncSnapshot<CategoryResponse> snapshot) {
                      if (snapshot.hasData) {
                        return buildCategory(snapshot);
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
                homeCategory('Mais Vendidos'),
                StreamBuilder(
                  stream: productsBloc.mostSoldProducts,
                  builder: (context,
                      AsyncSnapshot<MostSoldProductsResponse> snapshot) {
                    if (snapshot.hasData) {
                      return buildMostBuildProducts(snapshot);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
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

  Widget drawerOption(String imageName, String optionName, Function() callback){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: InkWell(
        onTap: () => callback,
        child: Row(
          children: <Widget>[
            Image.asset(
              'images/$imageName.png',
              scale: 4,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                optionName,
                style: TextStyle(
                    color: Color(0xFF000000),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: -0.3),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget appDrawer(){
    return Drawer(
      elevation: 3,
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Text(
                  'a Lodjinha',
                  style: TextStyle(fontFamily: 'Pacifico', fontSize: 24),
                ),
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Color(0xFFF15025),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset('images/logo_sobre.png'),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('images/menu_pattern.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          drawerOption('home_menu','Home', () => {}),
          drawerOption('tag_menu','Sobre o aplicativo', () => {})
        ],
      ),
    );
  }

  Widget homeCategory(String categoryTitle) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        categoryTitle,
        style: TextStyle(
            color: Color(0xFF2D3142),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.normal,
            fontSize: 17),
      ),
    );
  }

  Widget homeAppBar() {
    return AppBar(
      title: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Image.asset(
              'images/logo_menu.png',
              fit: BoxFit.scaleDown,
              height: 45,
            ),
          ),
          Text(
            'a Lodjinha',
            style: TextStyle(fontFamily: 'Pacifico'),
          ),
        ],
      ),
    );
  }

  Widget buildCarousel(AsyncSnapshot<BannerResponse> snapshot) {
    return CustomCarousel(
        images: snapshot.data.data.map(
      (model) {
        return NetworkImage(model.imageUrl);
      },
    ).toList());
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
        ProductModel mostSoldProductsModel = snapshot.data.data[index];
        return ThinProductCard(productsModel: mostSoldProductsModel);
      },
    ));
  }

}
