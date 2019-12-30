import 'package:flutter/material.dart';
import 'package:minostechsapp/services/auth_service.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FlatButton(
          onPressed: () => AuthService.logout(context),
          child: Text('logout'),
        ),
      ),
    );
  }
}
