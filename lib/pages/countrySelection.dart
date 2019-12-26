import 'package:flutter/material.dart';
import '../global.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';

class CountrySelection extends StatefulWidget {
  @override
  _CountrySelectionState createState() => _CountrySelectionState();

  Widget build(BuildContext context) {
    return null;
  }
}

class _CountrySelectionState extends State<CountrySelection> {
  Country _selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Select your Country",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: grayColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: CountryPicker(
                      showDialingCode: true,
                      onChanged: (Country country) {
                        setState(() {
                          _selected = country;
                        });
                      },
                      selectedCountry: _selected,
                    ),
                  ),
                  // Con esto almacenamos el nombre del pais seleccionado: _selected.name
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
