import 'package:flutter/material.dart';
import 'package:minostechsapp/custom/visit_card.dart';
import 'package:minostechsapp/models/card_data.dart';
import 'package:minostechsapp/models/user_data.dart';
import 'package:minostechsapp/models/user_model.dart';
import 'package:minostechsapp/models/visitCard_model.dart';
import 'package:minostechsapp/utilities/global.dart';
import 'package:minostechsapp/pages/cardCreationScreen.dart';
import 'package:minostechsapp/services/database_service.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static final id = 'homeScreen';
  final String currentUserId;
  final String userId;

  Home({this.currentUserId, this.userId});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User _profileUser;

  @override
  void initState() {
    super.initState();
    _setupUser();
  }

  _setupUser() async {
    User profileUser = await DatabaseService.getUserWithId(widget.userId);
    setState(() {
      _profileUser = profileUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String currentUserId = Provider.of<UserData>(context).currentUserId;

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
                    currentUserId: currentUserId,
                    userId: currentUserId,
                    color: orangeColor,
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 30),
                      Center(
                        child: GestureDetector(
                          onTap: () => '',
                          child: Container(
                            width: 150.0,
                            height: 150.0,
                            decoration: BoxDecoration(
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
                      ),
                      //   child: Image.asset(
                      //     'assets/images/shareCard.png',
                      //     width: 200.0,
                      //   ),
                      // ),
                      //),
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
