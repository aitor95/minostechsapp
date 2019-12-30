import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minostechsapp/global.dart';
import 'package:minostechsapp/pages/signupScreen.dart';
import 'package:minostechsapp/pages/interestsScreen.dart';

class Login extends StatefulWidget {
  static final String id = 'loginScreen';

  @override
  _LoginState createState() => _LoginState();

  Widget build(BuildContext context) {
    return null;
  }
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String _username, _password;

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_username);
      print(_password);
      //* TODO: Attempt to Login the user
    }
  }

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Image.asset('assets/images/MinosTechsLogo.png',
                          width: 80),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      child: Text(
                        "Welcome!",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 42.0,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      child: Text(
                        "Log in to your account.",
                        style: TextStyle(fontSize: 20.0, color: grayColor),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                            // padding: EdgeInsets.only(top: 230.0),
                            child: TextFormField(
                              validator: (input) => input.length <= 0
                                  ? 'Please enter a Username'
                                  : null,
                              onSaved: (input) => _username = input,
                              decoration:
                                  InputDecoration(labelText: 'Username'),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            // padding: EdgeInsets.only(top: 320.0),
                            child: TextFormField(
                              validator: (input) => input.length < 6
                                  ? 'Must be at least 6 characters'
                                  : null,
                              onSaved: (input) => _password = input,
                              decoration:
                                  InputDecoration(labelText: 'Password'),
                              obscureText: true,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 50.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                RaisedButton(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 58.0),
                                  onPressed: () => _submit(),
                                  // Navigator.pushNamed(
                                  //     context, Interests.id),
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
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  elevation: 10.0,
                                  textColor: whiteColor,
                                  color: linkedInColor,
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 30),
                            child: Center(
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Don't have account?",
                                        style: TextStyle(fontSize: 15)),
                                    FlatButton(
                                      onPressed: () => Navigator.pushNamed(
                                          context, SignUp.id),
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
