import 'package:oliveagro/Library/Language_Library/lib/easy_localization_delegate.dart';
import 'package:oliveagro/Library/Language_Library/lib/easy_localization_provider.dart';
import 'package:flutter/material.dart';
import 'package:oliveagro/UI/AcountUIComponent/AboutApps.dart';
import 'package:oliveagro/UI/AcountUIComponent/CallCenter.dart';
import 'package:oliveagro/UI/AcountUIComponent/Message.dart';
import 'package:oliveagro/UI/AcountUIComponent/languageSetting.dart';
import 'package:oliveagro/UI/LoginOrSignup/ChoseLoginOrSignup.dart';
import 'package:oliveagro/UI/AcountUIComponent/CreditCardSetting.dart';
import 'package:oliveagro/UI/AcountUIComponent/MyOrders.dart';
import 'package:oliveagro/UI/AcountUIComponent/Notification.dart';
import 'package:oliveagro/UI/AcountUIComponent/SettingAcount.dart';
import 'package:oliveagro/UI/LoginOrSignup/Signup.dart';
import '../../constants.dart' as constants;

class profil extends StatefulWidget {
  @override
  _profilState createState() => _profilState();
}

/// Custom Font
var _txt = TextStyle(
  color: Colors.black,
  fontFamily: "Sans",
);

/// Get _txt and custom value of Variable for Name User
var _txtName = _txt.copyWith(fontWeight: FontWeight.w700, fontSize: 17.0);

/// Get _txt and custom value of Variable for Edit text
var _txtEdit = _txt.copyWith(color: Colors.black26, fontSize: 15.0);

/// Get _txt and custom value of Variable for Category Text
var _txtCategory = _txt.copyWith(
    fontSize: 14.5, color: Colors.black54, fontWeight: FontWeight.w500);

class _profilState extends State<profil> {
  @override
  Widget build(BuildContext context) {
    /// Declare MediaQueryData
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    /// To Sett PhotoProfile,Name and Edit Profile
    var _profile = Padding(
      padding: EdgeInsets.only(
        top: 185.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2.5),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/img/personplaceholder.jpg"))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  // AppLocalizations.of(context).tr('name'),
                  "Idowu Oluwatosin",
                  style: _txtName,
                ),
              ),
              InkWell(
                onTap: null,
                child: Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Text(
                    AppLocalizations.of(context).tr('editProfile'),
                    style: _txtEdit,
                  ),
                ),
              ),
            ],
          ),
          Container(),
        ],
      ),
    );

    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              /// Setting Header Banner
              Container(
                height: 240.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/img/headerProfile.png"),
                        fit: BoxFit.cover)),
              ),

              /// Calling _profile variable
              _profile,
              Padding(
                padding: const EdgeInsets.only(top: 360.0),
                child: Column(
                  /// Setting Category List
                  children: <Widget>[
                    /// Call category class
                    category(
                      txt: AppLocalizations.of(context).tr('Notifications'),
                      padding: 35.0,
                      image: "assets/icon/notification.png",
                      tap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder: (_, __, ___) => new notification()));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 85.0, right: 30.0),
                      child: Divider(
                        color: Colors.black12,
                        height: 2.0,
                      ),
                    ),
                    category(
                      txt: AppLocalizations.of(context).tr('Subscriptions'),
                      padding: 35.0,
                      image: "assets/icon/creditAcount.png",
                      tap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder: (_, __, ___) =>
                                new creditCardSetting()));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 85.0, right: 30.0),
                      child: Divider(
                        color: Colors.black12,
                        height: 2.0,
                      ),
                    ),

                    category(
                      txt: AppLocalizations.of(context).tr('Your Products'),
                      padding: 23.0,
                      image: "assets/icon/truck.png",
                      tap: () {
                        // Navigator.of(context).push(
                        //   PageRouteBuilder(
                        //       pageBuilder: (_, __, ___) => new order()),
                        // );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 85.0, right: 30.0),
                      child: Divider(
                        color: Colors.black12,
                        height: 2.0,
                      ),
                    ),
                    category(
                      txt: AppLocalizations.of(context).tr('Post a product'),
                      padding: 23.0,
                      image: "assets/icon/truck.png",
                      tap: () {
                        // Navigator.of(context).push(
                        //   PageRouteBuilder(
                        //       pageBuilder: (_, __, ___) => new order()),
                        // );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 85.0, right: 30.0),
                      child: Divider(
                        color: Colors.black12,
                        height: 2.0,
                      ),
                    ),
                    category(
                      txt: AppLocalizations.of(context).tr('settingAccount'),
                      padding: 30.0,
                      image: "assets/icon/setting.png",
                      tap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder: (_, __, ___) => new settingAcount()));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 85.0, right: 30.0),
                      child: Divider(
                        color: Colors.black12,
                        height: 2.0,
                      ),
                    ),

                    category(
                      padding: 38.0,
                      txt: AppLocalizations.of(context).tr('aboutApps'),
                      image: "assets/icon/aboutapp.png",
                      tap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder: (_, __, ___) => new aboutApps()));
                      },
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 20.0)),
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

/// Component category class to set list
class category extends StatelessWidget {
  @override
  String txt, image;
  GestureTapCallback tap;
  double padding;

  category({this.txt, this.image, this.tap, this.padding});

  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 30.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: padding),
                  child: Image.asset(
                    image,
                    height: 25.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text(
                    txt,
                    style: _txtCategory,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
