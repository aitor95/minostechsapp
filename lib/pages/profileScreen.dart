import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:minostechsapp/utilities/global.dart';
import 'package:minostechsapp/models/user_model.dart';
import 'package:minostechsapp/services/auth_service.dart';
import 'package:minostechsapp/services/database_service.dart';
import 'package:minostechsapp/utilities/constants.dart';
// import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  final String currentUserId;
  final String userId;

  Profile({this.currentUserId, this.userId});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User _profileUser;

  @override
  void initState() {
    super.initState();
    _setupProfileUser();
  }

  _setupProfileUser() async {
    User profileUser = await DatabaseService.getUserWithId(widget.userId);
    setState(() {
      _profileUser = profileUser;
    });
  }

  _buildProfileInfo(User user) {
    String _name, _email, _userlinkedin;

    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(54.5, 70, 54.5, 0),
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 70.0,
                  backgroundColor: Colors.grey,
                  backgroundImage: user.profileImageUrl.isEmpty
                      ? AssetImage('assets/images/user_placeholder.jpg')
                      : CachedNetworkImageProvider(user.profileImageUrl),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  child: TextFormField(
                    validator: (input) =>
                        input.length <= 0 ? 'Name can\'t be empty' : null,
                    onSaved: (input) => _name = input,
                    decoration: InputDecoration(
                        labelText: user.name.isEmpty ? 'Name' : user.name),
                    enabled: false,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  child: TextFormField(
                    validator: (input) => !input.contains('@')
                        ? 'Enter a valid email address'
                        : null,
                    onSaved: (input) => _email = input,
                    decoration: InputDecoration(labelText: user.email),
                    enabled: false,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  child: TextFormField(
                    validator: (input) =>
                        input.length <= 0 ? 'Name can\'t be empty' : null,
                    onSaved: (input) => _userlinkedin = input,
                    decoration: InputDecoration(
                        labelText: user.userLinkedin.isEmpty
                            ? 'LinkedIn'
                            : user.userLinkedin),
                    enabled: false,
                  ),
                ),
                SizedBox(
                  height: 60.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton(
                      color: primaryGreenColor,
                      textColor: whiteColor,
                      padding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 32.0),
                      splashColor: primaryGreenColor.withOpacity(0.7),
                      onPressed: () => '',
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    FlatButton(
                      color: primaryGreenColor,
                      textColor: whiteColor,
                      padding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 32.0),
                      splashColor: primaryGreenColor.withOpacity(0.7),
                      onPressed: () => AuthService.logout(context),
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                FlatButton(
                  child: Text("Delete Account",
                      style: TextStyle(
                          fontSize: 15,
                          color: primaryGreenColor,
                          fontWeight: FontWeight.w600)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FutureBuilder(
          future: usersRef.document(widget.userId).get(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            User user = User.fromDoc(snapshot.data);
            return ListView(
              children: <Widget>[
                _buildProfileInfo(user),
                // Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}
