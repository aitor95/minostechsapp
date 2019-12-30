import 'package:flutter/material.dart';
import 'package:minostechsapp/global.dart';
import 'package:minostechsapp/helper/cardColors.dart';
// import 'package:minostechsapp/pages/interestsScreen.dart';

class CardCreation extends StatefulWidget {
  @override
  _CardCreationState createState() => _CardCreationState();
}

class _CardCreationState extends State<CardCreation> {
  static final String id = 'CardCreation';
  final _formKey = GlobalKey<FormState>();
  String _username, _profession, _linkedin, _file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Select your Card Color",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20.0,
              ),
              cardColors(),
              SizedBox(
                height: 50.0,
              ),
              Text(
                "Add your Information",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20.0,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      // padding: EdgeInsets.only(top: 230.0),
                      child: TextFormField(
                        // validator: (input) =>
                        //     input.length <= 0 ? 'Please enter a Username' : null,
                        onSaved: (input) => _username = input,
                        decoration: InputDecoration(labelText: 'Username'),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      // padding: EdgeInsets.only(top: 320.0),
                      child: TextFormField(
                        // validator: (input) => input.length < 6
                        //     ? 'Must be at least 6 characters'
                        //     : null,
                        onSaved: (input) => _profession = input,
                        decoration: InputDecoration(labelText: 'Profession'),
                        obscureText: true,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      // padding: EdgeInsets.only(top: 320.0),
                      child: TextFormField(
                        // validator: (input) => input.length < 6
                        //     ? 'Must be at least 6 characters'
                        //     : null,
                        onSaved: (input) => _linkedin = input,
                        decoration:
                            InputDecoration(labelText: 'LinkedIn (Optional'),
                        obscureText: true,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: TextFormField(
                        //   // validator: (input) => input.length < 6
                        //   //     ? 'Must be at least 6 characters'
                        //   //     : null,
                        onSaved: (input) => _file = input,
                        decoration:
                            InputDecoration(labelText: 'Add File (Optional) '),
                        obscureText: true,
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Container(
                      // padding: EdgeInsets.fromLTRB(0, 520, 0, 0),
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
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardColors() {
    final _dotSize =
        (MediaQuery.of(context).size.width - 220) / CardColor.baseColors.length;

    List<Widget> dotList = new List<Widget>();

    for (var i = 0; i < CardColor.baseColors.length; i++) {
      if (i == 0) {
        dotList.add(
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () => print(CardColor.baseColorsNames[i]),
              child: Container(
                width: _dotSize,
                height: _dotSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: CardColor.baseColors[i],
                ),
              ),
            ),
          ),
        );
      } else {
        dotList.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GestureDetector(
              onTap: () => print(CardColor.baseColorsNames[i]),
              child: Container(
                width: _dotSize,
                height: _dotSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: CardColor.baseColors[i],
                ),
              ),
            ),
          ),
        );
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: dotList,
    );
  }
}
