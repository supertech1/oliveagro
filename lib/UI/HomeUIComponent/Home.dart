import 'package:oliveagro/Library/Language_Library/lib/easy_localization_delegate.dart';
import 'package:oliveagro/Library/Language_Library/lib/easy_localization_provider.dart';
import 'package:oliveagro/Library/carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:oliveagro/Library/countdown_timer/countDownTimer.dart';
import 'package:oliveagro/ListItem/HomeGridItemRecomended.dart';
import 'package:oliveagro/ListItem/MenuItem.dart';
import 'package:oliveagro/UI/HomeUIComponent/AppbarGradient.dart';
import 'package:oliveagro/UI/HomeUIComponent/CategoryDetail.dart';
import 'package:oliveagro/UI/HomeUIComponent/DetailProduct.dart';
import 'package:oliveagro/UI/HomeUIComponent/FlashSale.dart';
import 'package:oliveagro/UI/HomeUIComponent/MenuDetail.dart';
import 'package:oliveagro/UI/HomeUIComponent/PromotionDetail.dart';
import '../../constants.dart' as constants;

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

/// Component all widget in home
class _MenuState extends State<Menu> with TickerProviderStateMixin {
  /// Declare class GridItem from HomeGridItemReoomended.dart in folder ListItem
  GridItem gridItem;

  bool isStarted = false;

  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double size = mediaQueryData.size.height;

    /// Declare device Size
    var deviceSize = MediaQuery.of(context).size;

    /// ImageSlider in header
    var imageSlider = Container(
      height: 182.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        dotColor: Color(0xFF6991C7).withOpacity(0.8),
        dotSize: 5.5,
        dotSpacing: 16.0,
        dotBgColor: Colors.transparent,
        showIndicator: true,
        overlayShadow: true,
        overlayShadowColors: Colors.white.withOpacity(0.9),
        overlayShadowSize: 0.9,
        images: [
          AssetImage("assets/img/homebanner1.jpg"),
          AssetImage("assets/img/homebanner2.jpg"),
          AssetImage("assets/img/homebanner3.jpg"),
        ],
      ),
    );

    /// CategoryIcon Component
    var categoryIcon = SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 20.0, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              // AppLocalizations.of(context).tr('menu'),
              "Popular Categories",
              style: TextStyle(
                  fontSize: 17,
                  fontFamily: "Sans",
                  fontWeight: FontWeight.w700),
            ),
            CategoryPanel(),
          ],
        ),
      ),
    );

    ///  Grid item in bottom of Category
    var Grid = SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
              child: Text(
                AppLocalizations.of(context).tr('Latest Products'),
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17.0,
                ),
              ),
            ),

            /// To set GridView item
            GridView.count(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 17.0,
                childAspectRatio: 0.545,
                crossAxisCount: 2,
                primary: false,
                children: List.generate(
                  itemPopularData.length,
                  (index) => menuItemCard(itemPopularData[index]),
                ))
          ],
        ),
      ),
    );

    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        /// Use Stack to costume a appbar
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(
                          top: mediaQueryData.padding.top + 58.5)),

                  /// Call var imageSlider
                  imageSlider,

                  /// Call var categoryIcon
                  categoryIcon,
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),

                  Grid,
                ],
              ),
            ),

            /// Get a class AppbarGradient
            /// This is a Appbar in home activity
            AppbarGradient(),
          ],
        ),
      ),
    );
  }
}

class menuItemCard extends StatelessWidget {
  menuItem item;

  menuItemCard(this.item);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 20.0, left: 10.0, bottom: 10.0, right: 0.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF656565).withOpacity(0.15),
                  blurRadius: 2.0,
                  spreadRadius: 1.0,
//           offset: Offset(4.0, 10.0)
                )
              ]),
          child: Wrap(
            children: <Widget>[
              Container(
                width: 160.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 140.0,
                          width: 160.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(7.0),
                                  topRight: Radius.circular(7.0)),
                              image: DecorationImage(
                                  image: AssetImage(item.image),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          height: 25.5,
                          width: 55.0,
                          decoration: BoxDecoration(
                            color: constants.kMainColor,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20.0),
                              topLeft: Radius.circular(5.0),
                            ),
                          ),
                          child: Center(
                              child: Text(
                            "",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )),
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 7.0)),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Text(
                        item.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            letterSpacing: 0.5,
                            color: Colors.black54,
                            fontFamily: "Sans",
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 1.0)),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Text(
                        item.salary,
                        style: TextStyle(
                            fontFamily: "Sans",
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 3, bottom: 3),
                      child: Text("Seller : ${item.seller}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                item.rating,
                                style: TextStyle(
                                    fontFamily: "Sans",
                                    color: Colors.black26,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 14.0,
                              )
                            ],
                          ),
                          Text(
                            item.sale,
                            style: TextStyle(
                                fontFamily: "Sans",
                                color: Colors.black26,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        color: constants.kMainColor,
                        onPressed: () {},
                        child: Text("Contact Seller",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryPanel extends StatelessWidget {
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {
        "title": "Fruits & Vegetables",
        "imageUrl": "assets/img/cereals.png",
      },
      {
        "title": "Spices",
        "imageUrl": "assets/img/cereals.png",
      },
      {
        "title": "Drinks",
        "imageUrl": "assets/img/cereals.png",
      },
      {
        "title": "Dry Herb",
        "imageUrl": "assets/img/cereals.png",
      },
      {
        "title": "Legumes",
        "imageUrl": "assets/img/cereals.png",
      },
      {
        "title": "Oils",
        "imageUrl": "assets/img/cereals.png",
      },
      // {
      //   "title": "Flowers",
      //   "imageUrl": "assets/img/cereals.png",
      // },
    ];
    return GridView.builder(
      shrinkWrap: true,
      itemCount: categories.length,
      primary: false,
      itemBuilder: (ctx, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(constants.kHomeSubCategory,
                arguments: {
                  "index": index,
                  "title": categories[index]['title']
                });
          },
          child: Column(
            children: <Widget>[
              Image.asset(
                categories[index]['imageUrl'],
                height: 19.2,
              ),
              Padding(padding: EdgeInsets.only(top: 7.0)),
              Text(
                categories[index]['title'],
                style: TextStyle(
                  fontFamily: "Sans",
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          childAspectRatio: 3 / 2),
    );
  }
}
