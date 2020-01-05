import 'package:flutter/material.dart';
import 'package:minostechsapp/utilities/global.dart';
import 'package:minostechsapp/helper/cardColors.dart';
// import 'package:minostechsapp/pages/interestsScreen.dart';

class CardCreation extends StatefulWidget {
  @override
  _CardCreationState createState() => _CardCreationState();
}

class _CardCreationState extends State<CardCreation> {
  static final String id = 'CardCreation';
  final _formKey = GlobalKey<FormState>();
  String _name,
      _surname1,
      _surname2,
      _profession,
      _linkedin,
      _file,
      _colorpicked;

  List<String> _inputTile;

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      // Send the information to update the table of cards collection related to the user
      // print(_name);
      // print(_surname1);
      // print(_surname2);
      // print(_colorpicked);
    }
  }

  //TODO: Match Theme in CardCreation
  //TODO: CreateView once clicked on the card, for edit

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
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
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
                      child: TextFormField(
                        onSaved: (input) => {
                          _inputTile = input.split(" "),
                          _name = _inputTile[0],
                          _surname1 = _inputTile[1],
                          _surname2 = _inputTile[2],
                        }, //_username = input,
                        decoration:
                            InputDecoration(labelText: 'Name and surnames'),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      // padding: EdgeInsets.only(top: 320.0),
                      child: TextFormField(
                        validator: (input) =>
                            input.isEmpty ? 'Profession can\'t be empty' : null,
                        onSaved: (input) => _profession = input,
                        decoration: InputDecoration(labelText: 'Profession'),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: TextFormField(
                        onSaved: (input) => _linkedin = input,
                        decoration:
                            InputDecoration(labelText: 'LinkedIn (Optional)'),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: TextFormField(
                        onSaved: (input) => _file = input,
                        decoration:
                            InputDecoration(labelText: 'Add File (Optional) '),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Container(
                      child: Center(
                        child: RaisedButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 51.0),
                          onPressed: () => _submit(),
                          child: const Text('Create',
                              style: TextStyle(fontSize: 20)),
                          elevation: 10.0,
                          textColor: whiteColor,
                          color: primaryGreenColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
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

  // Widget to create the row of the 7 colors available to pick
  Widget cardColors() {
    final _dotSize =
        (MediaQuery.of(context).size.width - 220) / CardColor.baseColors.length;

    List<Widget> dotList = new List<Widget>();

    for (var i = 0; i < CardColor.baseColors.length; i++) {
      dotList.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: GestureDetector(
            onTap: () => '',
            child: Container(
              width: _dotSize,
              height: _dotSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: CardColor.baseColors[i],
              ),
              child: IconButton(
                padding: EdgeInsets.all(2.0),
                icon: CardColor.isLiked[i] == "true"
                    ? Icon(
                        Icons.check,
                        color: blackColor,
                        size: 20.0,
                      )
                    : Icon(
                        Icons.check,
                        color: CardColor.baseColors[i],
                        size: 20.0,
                      ),
                onPressed: () {
                  setState(() {
                    CardColor.isLiked[i] =
                        CardColor.isLiked[i] == "true" ? "false" : "true";
                    checkOthers(iterator: i);
                    _colorpicked = CardColor.baseColorsNames[i];
                  });
                },
              ),
            ),
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: dotList,
    );
  }

  // Diselect the others color that are not currently selected
  void checkOthers({int iterator}) {
    for (var i = 0; i < CardColor.isLiked.length; i++) {
      if (i != iterator) {
        CardColor.isLiked[i] = "false";
      }
    }
  }
}
