import 'dart:async';

import 'package:oliveagro/Library/Language_Library/lib/easy_localization_delegate.dart';
import 'package:oliveagro/Library/Language_Library/lib/easy_localization_provider.dart';
import 'package:flutter/material.dart';
import 'package:oliveagro/UI/LoginOrSignup/LoginAnimation.dart';
import 'package:oliveagro/UI/LoginOrSignup/Signup.dart';
import '../../constants.dart' as constants;

class loginScreen extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
}

/// Component Widget this layout UI
class _loginScreenState extends State<loginScreen>
    with TickerProviderStateMixin {
  //Animation Declaration
  // AnimationController sanimationController;

  var tap = 0;

  @override

  /// set state animation controller
  void initState() {
    // sanimationController =
    //     AnimationController(vsync: this, duration: Duration(milliseconds: 800))
    //       ..addStatusListener((statuss) {
    //         if (statuss == AnimationStatus.dismissed) {
    //           setState(() {
    //             tap = 0;
    //           });
    //         }
    //       });
    // // TODO: implement initState
    super.initState();
  }

  /// Dispose animation controller
  // @override
  // void dispose() {
  //   sanimationController.dispose();
  //   super.dispose();
  // }

  // /// Playanimation set forward reverse
  // Future<Null> _PlayAnimation() async {
  //   try {
  //     await sanimationController.forward();
  //     await sanimationController.reverse();
  //   } on TickerCanceled {}
  // }

  /// Component Widget layout UI
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    mediaQueryData.devicePixelRatio;
    mediaQueryData.size.width;
    mediaQueryData.size.height;

    var data = EasyLocalizationProvider.of(context).data;

    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          /// Set Background image in layout (Click to open code)
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/loginscreenbg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            /// Set gradient color in image (Click to open code)
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(0, 0, 0, 0.0),
                  Color.fromRGBO(0, 0, 0, 0.3)
                ],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
              ),
            ),

            /// Set component layout
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: AlignmentDirectional.topCenter,
                  child: Column(
                    children: <Widget>[
                      /// padding logo
                      Padding(
                          padding: EdgeInsets.only(
                              top: mediaQueryData.padding.top + 40.0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0)),

                          /// Animation text treva shop accept from signup layout (Click to open code)
                          Hero(
                            tag: "Olive",
                            child: Container(
                              padding: EdgeInsets.only(right: 30),
                              height: 75,
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 3),
                                curve: Curves.easeIn,
                                child: Image.asset("assets/img/logo_olive.png",
                                    fit: BoxFit.cover),
                              ),
                            ),
                            // Text(
                            //   // AppLocalizations.of(context).tr('title'),
                            //   "Olive Agro",
                            //   style: TextStyle(
                            //       fontWeight: FontWeight.w900,
                            //       letterSpacing: 0.6,
                            //       color: Colors.white,
                            //       fontFamily: "Sans",
                            //       fontSize: 20.0),
                            // ),
                          ),
                        ],
                      ),

                      Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
                      textFromField(
                        icon: Icons.email,
                        password: false,
                        email: AppLocalizations.of(context).tr('email'),
                        inputType: TextInputType.emailAddress,
                      ),

                      /// TextFromField Password
                      Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                      textFromField(
                        icon: Icons.vpn_key,
                        password: true,
                        email: AppLocalizations.of(context).tr('password'),
                        inputType: TextInputType.text,
                      ),

                      /// Button Signup
                      FlatButton(
                          padding: EdgeInsets.only(top: 20.0),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        new Signup()));
                          },
                          child: Text(
                            AppLocalizations.of(context).tr('notHave'),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Sans"),
                          )),
                    ],
                  ),
                ),
                InkWell(
                  splashColor: Colors.yellow,
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(constants.kBottomNavigationBar);
                  },
                  child: buttonBlackBottom(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// textfromfield custom class
class textFromField extends StatelessWidget {
  bool password;
  String email;
  IconData icon;
  TextInputType inputType;

  textFromField({this.email, this.icon, this.inputType, this.password});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        height: 60.0,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 10.0, color: Colors.black12)]),
        padding:
            EdgeInsets.only(left: 20.0, right: 30.0, top: 0.0, bottom: 0.0),
        child: Theme(
          data: ThemeData(
            hintColor: Colors.transparent,
          ),
          child: TextFormField(
            obscureText: password,
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: email,
                icon: Icon(
                  icon,
                  color: Colors.black38,
                ),
                labelStyle: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Sans',
                    letterSpacing: 0.3,
                    color: Colors.black38,
                    fontWeight: FontWeight.w600)),
            keyboardType: inputType,
          ),
        ),
      ),
    );
  }
}

///ButtonBlack class
class buttonBlackBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Container(
        height: 55.0,
        width: 600.0,
        child: Text(
          AppLocalizations.of(context).tr('login'),
          style: TextStyle(
              color: Colors.white,
              letterSpacing: 0.2,
              fontFamily: "Sans",
              fontSize: 18.0,
              fontWeight: FontWeight.w800),
        ),
        alignment: FractionalOffset.center,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 15.0)],
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(
                colors: <Color>[Color(0xFF0b4900), Color(0xFF178e02)])),
      ),
    );
  }
}
