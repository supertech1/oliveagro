import 'package:flutter/material.dart';
import '../../constants.dart' as constants;

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                SizedBox(
                  height: 60,
                ),
                CategoryItem(
                  title: "FRUITS AND VEGETABLES ",
                  image: "assets/img/vegetablesbanner1.jpg",
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      constants.kHomeSubCategory,
                      arguments: {"title": "FRUITS AND VEGETABLES", "index": 0},
                    );
                  },
                ),
                CategoryItem(
                  title: "SPICES",
                  image: "assets/img/grainsbanner.jpg",
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      constants.kHomeSubCategory,
                      arguments: {"title": "SPICES", "index": 1},
                    );
                  },
                ),
                CategoryItem(
                  title: "DRINKS",
                  image: "assets/img/drinks.jpg",
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      constants.kHomeSubCategory,
                      arguments: {"title": "DRINKS", "index": 2},
                    );
                  },
                ),
                CategoryItem(
                  title: "DRY HERB",
                  image: "assets/img/dryherb.jpg",
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      constants.kHomeSubCategory,
                      arguments: {"title": "DRY HERB", "index": 3},
                    );
                  },
                ),
                CategoryItem(
                  title: "LEGUMES",
                  image: "assets/img/cerealsbanner.jpg",
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      constants.kHomeSubCategory,
                      arguments: {"title": "LEGUMES", "index": 4},
                    );
                  },
                ),
                CategoryItem(
                  title: "OILS",
                  image: "assets/img/oils.jpg",
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      constants.kHomeSubCategory,
                      arguments: {"title": "OILS", "index": 5},
                    );
                  },
                ),
                CategoryItem(
                  title: "FLOURS",
                  image: "assets/img/flours.jpg",
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      constants.kHomeSubCategory,
                      arguments: {"title": "FLOURS", "index": 6},
                    );
                  },
                ),
              ],
            ),
          ),
          AppbarGradient()
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  String title, image;
  Function onTap;
  CategoryItem({this.title, this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Card(
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 4,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("$image"), fit: BoxFit.cover)),
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            height: 130,
            child: Text(
              "$title",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Berlin",
                fontSize: 35.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppbarGradient extends StatefulWidget {
  @override
  _AppbarGradientState createState() => _AppbarGradientState();
}

class _AppbarGradientState extends State<AppbarGradient> {
  /// Build Appbar in layout home
  @override
  Widget build(BuildContext context) {
    /// Create responsive height and padding
    final MediaQueryData media = MediaQuery.of(context);
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    /// Create component in appbar
    return Container(
      padding: EdgeInsets.only(top: statusBarHeight, left: 20, right: 20),
      height: 58.0 + statusBarHeight,
      decoration: BoxDecoration(
        /// gradient in appbar
        // gradient: LinearGradient(
        //     colors: [
        //       constants.kMainColorLight,
        //       constants.kMainColor,
        //     ],
        //     begin: const FractionalOffset(0.0, 0.0),
        //     end: const FractionalOffset(1.0, 0.0),
        //     stops: [0.0, 1.0],
        //     tileMode: TileMode.clamp),
        color: constants.kMainColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          /// if user click shape white in appbar navigate to search layout
          Text(
            "All Category",
            style: TextStyle(
                fontFamily: "Gotik",
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
          Icon(
            Icons.search,
            color: Colors.white,
            size: 30,
          ),
        ],
      ),
    );
  }
}
