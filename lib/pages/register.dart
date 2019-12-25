import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minostechsapp/global.dart';
import 'package:minostechsapp/pages/login.dart';
import '../slideNavigation/slideRight.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();

  Widget build(BuildContext context) {
    return null;
  }
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Montserrat'),
      // debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(54.5, 100, 54.5, 0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Hi!",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 42.0,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 60.0),
                      child: Text(
                        "Create new account.",
                        style: TextStyle(fontSize: 20.0, color: grayColor),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 130.0),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Username'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 220.0),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Password'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 310.0),
                      child: TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Confirm Password'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 400.0),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Email'),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 520, 0, 0),
                        child: Center(
                          child: RaisedButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 51.0),
                            onPressed: () {},
                            child: const Text('Sign Up',
                                style: TextStyle(fontSize: 20)),
                            elevation: 10.0,
                            textColor: whiteColor,
                            color: primaryGreenColor,
                          ),
                        )),
                    Container(
                      padding: EdgeInsets.only(top: 600),
                      child: Center(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Have an account?",
                                  style: TextStyle(fontSize: 15)),
                              FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                      context, SlideRightRoute(page: Login()));
                                },
                                child: Text("Sign In",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: primaryGreenColor,
                                        fontWeight: FontWeight.w600)),
                              )
                            ],
                          ),
                          alignment: Alignment(0, 0),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
