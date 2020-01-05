import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minostechsapp/services/database_service.dart';
import 'package:minostechsapp/utilities/global.dart';
import 'package:minostechsapp/Navigation/slideLeft.dart';
import 'package:minostechsapp/pages/countrySelectionScreen.dart';

class Interests extends StatefulWidget {
  static final String id = 'interestsScreen';

  @override
  _InterestsState createState() => _InterestsState();

  Widget build(BuildContext context) {
    return null;
  }
}

class _InterestsState extends State<Interests> {
  // bool _isChecked;
  int _selectedRadioTile;

  void initState() {
    super.initState();
    _selectedRadioTile = 0;
  }

  setSelectedRadioTile(int value) {
    setState(() {
      _selectedRadioTile = value;
    });
  }

  _submit(int selected) {
    String interest;
    switch (selected) {
      case 1:
        interest = 'Make Contacts';
        break;
      case 2:
        interest = 'Contact Client - Business';
        break;
      case 3:
        interest = 'Retail Concern';
        break;
      case 4:
        interest = 'Presentations';
        break;
      case 5:
        interest = 'Stands Design';
        break;
      case 6:
        interest = 'Other';
        break;
    }
    //Update user with this interest
    Navigator.push(context, SlideLeftRoute(page: CountrySelection()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      home: Scaffold(
        backgroundColor: whiteColor,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(height: 50.0),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(color: whiteColor),
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Interests About the Congress",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 30),
                    Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          margin: EdgeInsets.only(bottom: 10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: grayColor),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: RadioListTile(
                            value: 1,
                            groupValue: _selectedRadioTile,
                            title: Text('Make Contacts'),
                            activeColor: primaryGreenColor,
                            onChanged: (value) {
                              setSelectedRadioTile(value);
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          margin: EdgeInsets.only(bottom: 10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: grayColor),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: RadioListTile(
                            value: 2,
                            groupValue: _selectedRadioTile,
                            title: Text('Contact Client - Business'),
                            activeColor: primaryGreenColor,
                            onChanged: (value) {
                              setSelectedRadioTile(value);
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          margin: EdgeInsets.only(bottom: 10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: grayColor),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: RadioListTile(
                            value: 3,
                            groupValue: _selectedRadioTile,
                            title: Text('Retail Concern'),
                            activeColor: primaryGreenColor,
                            onChanged: (value) {
                              setSelectedRadioTile(value);
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          margin: EdgeInsets.only(bottom: 10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: grayColor),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: RadioListTile(
                            value: 4,
                            groupValue: _selectedRadioTile,
                            title: Text('Presentations'),
                            activeColor: primaryGreenColor,
                            onChanged: (value) {
                              setSelectedRadioTile(value);
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          margin: EdgeInsets.only(bottom: 10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: grayColor),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: RadioListTile(
                            value: 5,
                            groupValue: _selectedRadioTile,
                            title: Text('Stands Design'),
                            activeColor: primaryGreenColor,
                            onChanged: (value) {
                              setSelectedRadioTile(value);
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          margin: EdgeInsets.only(bottom: 10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: grayColor),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: RadioListTile(
                            value: 6,
                            groupValue: _selectedRadioTile,
                            title: Text('Other'),
                            activeColor: primaryGreenColor,
                            onChanged: (value) {
                              setSelectedRadioTile(value);
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        FlatButton(
                          padding: EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 20.0,
                          ),
                          onPressed: () => _submit(_selectedRadioTile),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Next',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 20),
                                Icon(Icons.arrow_forward),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
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
