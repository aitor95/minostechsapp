import 'dart:async';
import 'package:flutter/material.dart';
import 'package:minostechsapp/global.dart';
import './authentication/login_authentication.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 2), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => AfterSplash()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryGreenColor,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 250.0),
            child:
                Image.asset('assets/images/MinosLogoNegative.png', width: 200),
          ),
          Container(
            padding: EdgeInsets.only(top: 300.0),
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(whiteColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
