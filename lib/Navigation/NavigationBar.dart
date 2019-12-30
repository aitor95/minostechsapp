import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:minostechsapp/global.dart';
import 'package:minostechsapp/pages/homeScreen.dart';
import 'package:minostechsapp/pages/sharedFilesScreen.dart';
import 'package:minostechsapp/pages/profileScreen.dart';

class NavigationBar extends StatefulWidget {
  static final id = 'navigationBarScreen';

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _currentTab = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryIconTheme:
            Theme.of(context).primaryIconTheme.copyWith(color: blackColor),
        fontFamily: 'Montserrat',
      ),
      home: Scaffold(
        body: PageView(
          controller: _pageController,
          children: <Widget>[
            Home(),
            SharedFiles(),
            Profile(),
          ],
          onPageChanged: (int index) {
            setState(() {
              _currentTab = index;
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: primaryGreenColor,
          currentIndex: _currentTab,
          // this will be set when a new tab is tapped
          onTap: (int index) {
            setState(() {
              _currentTab = index;
            });
            _pageController.jumpToPage(index);
            // .animateToPage(
            //   index,
            //   duration: Duration(milliseconds: 200),
            //   curve: Curves.easeInOutQuint,
            // );
          },

          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.inbox),
              title: new Text('Shared Files'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
            )
          ],
        ),
      ),
    );
  }
}
