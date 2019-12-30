import 'package:flutter/material.dart';
import 'package:minostechsapp/models/user_model.dart';

class CardWidget extends StatelessWidget {
  final Color color;
  final User user;

  CardWidget({this.color, this.user});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => '',
      child: Container(
        height: 180.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color.withOpacity(1),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(17.0, 20.0, 0.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 300.0,
                    child: Text(
                      user.name + " " + user.surname1 + " " + user.surname2,
                      style: TextStyle(
                        fontSize: 26.0,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                user.profession,
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    height: 80.0,
                  ),
                  Row(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/linkedin-square-logo.png',
                        width: 20.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        user.userLinkedin,
                        style: TextStyle(fontSize: 12.0),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
