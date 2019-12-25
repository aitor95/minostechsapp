import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minostechsapp/global.dart';
import 'package:minostechsapp/pages/register.dart';
import '../slideNavigation/slideLeft.dart';
import '../pages/interests.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();

  Widget build(BuildContext context) {
    return null;
  }
}

class _LoginState extends State<Login> {
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
                padding: EdgeInsets.fromLTRB(54.5, 140, 54.5, 0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Image.asset('assets/images/MinosTechsLogo.png',
                          width: 80),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 100.0),
                      child: Text(
                        "Welcome!",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 42.0,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 160.0),
                      child: Text(
                        "Log in to your account.",
                        style: TextStyle(fontSize: 20.0, color: grayColor),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 230.0),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Username'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 320.0),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Password'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 450, 0, 100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RaisedButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 58.0),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Interests()));
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(fontSize: 20),
                            ),
                            elevation: 10.0,
                            textColor: whiteColor,
                            color: primaryGreenColor,
                          ),
                          RaisedButton(
                            padding: EdgeInsets.all(16.0),
                            onPressed: () {},
                            child: const Text(
                              'in',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            elevation: 10.0,
                            textColor: whiteColor,
                            color: linkedInColor,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 540),
                      child: Center(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Don't have account?",
                                  style: TextStyle(fontSize: 15)),
                              FlatButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      SlideLeftRoute(page: Register()));
                                },
                                child: Text("Sign Up",
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
