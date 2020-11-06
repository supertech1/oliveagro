import 'package:oliveagro/Library/Language_Library/lib/easy_localization_delegate.dart';
import 'package:oliveagro/Library/Language_Library/lib/easy_localization_provider.dart';
import 'package:flutter/material.dart';
import 'package:oliveagro/UI/BrandUIComponent/BrandLayout.dart';
import 'package:oliveagro/UI/MessagesUIComponent/inbox.dart';
import 'package:oliveagro/UI/CategoryUIComponent/category.dart';
// import 'package:oliveagro/UI/CartUIComponent/CartLayout.dart';
import 'package:oliveagro/UI/HomeUIComponent/Home.dart';
import 'package:oliveagro/UI/AcountUIComponent/Profile.dart';
import '../constants.dart' as constants;

class bottomNavigationBar extends StatefulWidget {
  @override
  _bottomNavigationBarState createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {
  int currentIndex = 0;

  /// Set a type current number a layout class
  Widget callPage(int current) {
    switch (current) {
      case 0:
        return new Menu();
      case 1:
        return new Category();
      case 2:
        return new Inbox();
      case 3:
        return new profil();
        break;
      default:
        return Menu();
    }
  }

  /// Build BottomNavigationBar Widget
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        body: callPage(currentIndex),
        bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Colors.white,
                textTheme: Theme.of(context).textTheme.copyWith(
                    caption:
                        TextStyle(color: Colors.black26.withOpacity(0.15)))),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              fixedColor: constants.kMainColor,
              onTap: (value) {
                currentIndex = value;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      size: 23.0,
                    ),
                    title: Text(
                      AppLocalizations.of(context).tr('home'),
                      style:
                          TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    title: Text(
                      // AppLocalizations.of(context).tr('brand'),
                      "Products",
                      style:
                          TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(Icons.mail_outline),
                    title: Text(
                      // AppLocalizations.of(context).tr('cart'),
                      "Inbox",
                      style:
                          TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      size: 24.0,
                    ),
                    title: Text(
                      AppLocalizations.of(context).tr('account'),
                      style:
                          TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
                    )),
              ],
            )),
      ),
    );
  }
}
