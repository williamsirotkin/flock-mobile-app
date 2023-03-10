import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../Pages/SwipePage.dart';
import '../Pages/ProfilePage.dart';
import '../Pages/MyTripsPage.dart';
import '../Pages/FindTripsPage.dart';
import '../Pages/FriendsPage.dart';
import '../Pages/SafetyPage.dart';
import '../Pages/InboxPage.dart';
import '../Pages/SettingsPage.dart';
import '../Calls/FetchUsernameCall.dart';

class MenuProvider extends StatelessWidget {
  var page, user;
  MenuProvider({this.page, this.user});

  @override
  Widget build(BuildContext context) {
    var _selectedIndex = 0;

    Widget getPage(int index) {
      switch (index) {
        case 0:
          return ProfilePage(user: user, profileClickedOn: user);
        case 1:
          return SwipePage(username: fetchUsername());
        case 2:
          return MyTripsPage(user: user);
        case 3:
          return FindTripsPage(user: user);
        case 4:
          return FriendsPage(user: user);
      }
      return SwipePage();
    }

    void _onItemTapped(int index) {
      _selectedIndex = index;
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              MenuProvider(page: getPage(_selectedIndex), user: user)));
    }

    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );
    return Scaffold(
        appBar: AppBar(
          leading: TextButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                textStyle: MaterialStateProperty.all(
                    const TextStyle(fontSize: 14, color: Colors.white))),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      MenuProvider(page: SafetyPage(), user: user)));
            },
            child: Image(image: AssetImage('assets/images/safety.png')),
          ),
          title:
              const Text('Find Your Flock????', style: TextStyle(fontSize: 20)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        MenuProvider(page: InboxPage(), user: user)));
              },
              child: Image(image: AssetImage('assets/images/inbox.png')),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        MenuProvider(page: SettingsPage(), user: user)));
              },
              child: Image(image: AssetImage('assets/images/settings.png')),
            ),
          ],
        ),
        body: Center(
          child: page,
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Color.fromARGB(230, 230, 230, 230),
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: TextStyle(color: Colors.black54))),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image(
                    image: AssetImage('assets/images/profile.png'), height: 25),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Image(
                    image: AssetImage('assets/images/swipe.png'), height: 25),
                label: 'Swipe',
              ),
              BottomNavigationBarItem(
                icon: Image(
                    image: AssetImage('assets/images/mytrips.png'), height: 25),
                label: 'My Trips',
              ),
              BottomNavigationBarItem(
                icon: Image(
                    image: AssetImage('assets/images/findtrips.png'),
                    height: 25),
                label: 'Find Trips',
              ),
              BottomNavigationBarItem(
                icon: Image(
                    image: AssetImage('assets/images/friends.png'), height: 25),
                label: 'Friends',
              ),
            ],
            currentIndex: _selectedIndex,
            //selectedItemColor: Color.fromARGB(255, 246, 246, 245),
            onTap: _onItemTapped,
          ),
        ));
  }
}
