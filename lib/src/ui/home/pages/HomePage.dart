import 'package:flutter/material.dart';
import 'package:lodjinha/src/blocs/BannersBloc.dart';
import 'package:lodjinha/src/blocs/CategoriesBloc.dart';
import 'package:lodjinha/src/blocs/ProductsBloc.dart';
import 'package:lodjinha/src/models/BannerModel.dart';
import 'package:lodjinha/src/models/CategoryModel.dart';
import 'package:lodjinha/src/models/MostSoldProductsModel.dart';
import 'package:lodjinha/src/ui/common/AppnameText.dart';
import 'package:lodjinha/src/ui/common/ThinProductCard.dart';
import 'package:lodjinha/src/utils/ColorPalette.dart';
import 'package:lodjinha/src/utils/FontFamilies.dart';
import 'package:lodjinha/src/utils/Strings.dart';
import '../widgets/CategoryHomeCard.dart';
import '../widgets/CustomCarousel.dart';
import '../widgets/Drawer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    categoriesBloc.fetchAllCategories();
    productsBloc.fetchMostSoldProducts();
    bannersBloc.fetchAllBanners();
    return Scaffold(
      appBar: homeAppBar(),
      drawer: appDrawer(context),
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
                homeCategory(Strings.homeCategories),
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
                homeCategory(Strings.homeMostSold),
                StreamBuilder(
                  stream: productsBloc.mostSoldProducts,
                  builder: (context,
                      AsyncSnapshot<MostSoldProductsResponse> snapshot) {
                    if (snapshot.hasData) {
                      return buildMostSoldProducts(snapshot);
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

  Widget homeCategory(String categoryTitle) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        categoryTitle,
        style: TextStyle(
            color: ColorPalette.dark,
            fontFamily: FontFamilies.roboto,
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
          AppnameText(22),
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

  Widget buildMostSoldProducts(
      AsyncSnapshot<MostSoldProductsResponse> snapshot) {
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
      ),
    );
  }
}
