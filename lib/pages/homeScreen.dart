import 'package:flutter/material.dart';
import 'package:minostechsapp/custom/visit_card.dart';
import 'package:minostechsapp/models/visitCard_model.dart';
import 'package:minostechsapp/global.dart';
import 'package:minostechsapp/pages/cardCreationScreen.dart';

class Home extends StatefulWidget {
  static final id = 'homeScreen';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50.0,
            ),
            Container(
              decoration: BoxDecoration(color: whiteColor),
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "My Visit Card",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 30),
                  CardWidget(
                    color: orangeColor,
                    user: user,
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Text(
                      //   "Share your Card",
                      //   style: TextStyle(

                      //       fontSize: 20.0,
                      //       fontWeight: FontWeight.w600),
                      // ),
                      SizedBox(height: 30),
                      Center(
                        child: GestureDetector(
                          onTap: () => '',
                          child: Container(
                            width: 150.0,
                            height: 150.0,
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(50.0%),
                              shape: BoxShape.circle,
                              color: grayColor.withOpacity(0.5),
                            ),
                            child: Text(
                              'Share',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20.0, color: whiteColor),
                            ),
                            alignment: Alignment.center,
                          ),
                        ),
                        // child: Image.asset(
                        //   'assets/images/shareCard.png',
                        //   width: 300.0,
                        // ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Center(
                        child: FlatButton(
                          color: primaryGreenColor,
                          textColor: whiteColor,
                          padding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 32.0),
                          splashColor: primaryGreenColor.withOpacity(0.7),
                          onPressed: () =>
                              // Navigator.pushNamed(context, CardCreation.id),
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => CardCreation())),
                          child: Text(
                            'Add another Card',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
