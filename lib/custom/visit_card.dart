import 'package:flutter/material.dart';
import 'package:minostechsapp/models/user_data.dart';
import 'package:minostechsapp/models/user_model.dart';
import 'package:minostechsapp/services/database_service.dart';
import 'package:minostechsapp/utilities/constants.dart';
import 'package:provider/provider.dart';

class CardWidget extends StatefulWidget {
  final String currentUserId;
  final String userId;
  final Color color;

  CardWidget({this.currentUserId, this.userId, this.color});

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  User _profileUser;

  @override
  void initState() {
    super.initState();
    _setupUser();
  }

  _setupUser() async {
    User profileUser = await DatabaseService.getUserWithId(widget.userId);
    setState(() {
      _profileUser = profileUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => '',
      child: Container(
        height: 180.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.color.withOpacity(1),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(17.0, 20.0, 0.0, 0.0),
          child: FutureBuilder(
            future: usersRef.document(widget.userId).get(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              User user = User.fromDoc(snapshot.data);
              return Container(
                child: _buildCardInfo(user),
                // Divider(),
              );
            },
          ),
        ),
      ),
    );
  }

  _buildCardInfo(User user) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 300.0,
                child: Text(
                  user.name.isNotEmpty
                      ? user.name + " " + user.surname1 + " " + user.surname2
                      : 'Name surname surname',
                  style: TextStyle(
                    fontSize: 24.0,
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
            user.profession.isNotEmpty
                ? '${user.profession[0].toUpperCase()}${user.profession.substring(1)}'
                : 'Profession',
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
                    user.userLinkedin.isNotEmpty
                        ? user.userLinkedin
                        : 'userlinkedin',
                    style: TextStyle(fontSize: 12.0),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
