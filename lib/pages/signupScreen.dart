import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minostechsapp/utilities/global.dart';
import 'package:minostechsapp/pages/loginScreen.dart';
import 'package:minostechsapp/services/auth_service.dart';
// import 'package:minostechsapp/Navigation/slideRight.dart';

class SignUp extends StatefulWidget {
  static final String id = 'signUpScreen';
  @override
  _SignUpState createState() => _SignUpState();

  Widget build(BuildContext context) {
    return null;
  }
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final passKey = GlobalKey<FormFieldState>();
  String _username, _password, _confirmPassword, _email;

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // print(_username);
      // print(_password);
      // print(_confirmPassword);
      // print(_email);
      AuthService.signUpUser(context, _username, _email, _password);
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
                padding: EdgeInsets.fromLTRB(54.5, 100, 54.5, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: Text(
                        "Create new account.",
                        style: TextStyle(fontSize: 20.0, color: grayColor),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            child: TextFormField(
                              validator: (input) => !input.contains('@')
                                  ? 'Enter a valid email address'
                                  : null,
                              onSaved: (input) => _email = input,
                              decoration: InputDecoration(labelText: 'Email'),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            child: TextFormField(
                              key: passKey,
                              validator: (input) => input.length < 6
                                  ? 'Must be at least 6 characters'
                                  : null,
                              onSaved: (input) => _password = input,
                              decoration:
                                  InputDecoration(labelText: 'Password'),
                              obscureText: true,
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            child: TextFormField(
                              validator: (input) {
                                return input != passKey.currentState.value
                                    ? 'Passwords do not match'
                                    : null;
                              },
                              onSaved: (input) => _confirmPassword = input,
                              decoration: InputDecoration(
                                  labelText: 'Confirm Password'),
                              obscureText: true,
                            ),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          Center(
                            child: RaisedButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 58.0),
                              onPressed: () => _submit(),
                              // Navigator.pushNamed(
                              //     context, Interests.id),
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(fontSize: 20),
                              ),
                              elevation: 10.0,
                              textColor: whiteColor,
                              color: primaryGreenColor,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Center(
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Already have account?",
                                        style: TextStyle(fontSize: 15)),
                                    FlatButton(
                                      onPressed: () => Navigator.pushNamed(
                                          context, Login.id),
                                      child: Text("Sign in",
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
                                onPressed: () =>
                                    Navigator.pushNamed(context, Login.id),
                                child: Text("Sign In",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: primaryGreenColor,
                                        fontWeight: FontWeight.w600)),
                              ),
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
