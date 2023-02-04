import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../Pages/SwipePage.dart';
import '../Pages/ProfilePage.dart';

class MenuProvider extends StatelessWidget {
  var page;
  MenuProvider({this.page});
  
  @override
  Widget build(BuildContext context) {
    var _selectedIndex = 0;

    Widget getPage(int index) {
      switch(index) {
        case 0:
          return ProfilePage();
        case 1:
          return SwipePage();
        case 2:
          return SwipePage();
        case 3:
          return SwipePage();
        case 4:
            return SwipePage();
      }
      return SwipePage();
    }

    void _onItemTapped(int index) {
      _selectedIndex = index;
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MenuProvider(page: getPage(_selectedIndex))));
    }
  final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );
    return Scaffold (
      appBar: AppBar(
        leading: TextButton(
                style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(0)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 14, color: Colors.white))),
                onPressed: () {},
                child: Image(image: AssetImage('assets/images/safety.png')),
        ),
        title: const Text('Find Your Flock🕊', style: TextStyle(fontSize: 20)),
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: Image(image: AssetImage('assets/images/inbox.png')),
          ),
          TextButton(
            onPressed: () {},
            child: Image(image: AssetImage('assets/images/settings.png')),
          ),
        ],
     ),
      body: Center(
        child: page,
      ),
      bottomNavigationBar: Theme (
        data: Theme.of(context).copyWith(
              canvasColor: Color.fromARGB(230, 230, 230, 230),
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: TextStyle(color: Colors.black54))),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image(image: AssetImage('assets/images/profile.png'), height: 25),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Image(image: AssetImage('assets/images/swipe.png'), height: 25),
            label: 'Swipe',
          ),
          BottomNavigationBarItem(
            icon: Image(image: AssetImage('assets/images/mytrips.png'), height: 25),
            label: 'My Trips',
          ),
          BottomNavigationBarItem(
            icon: Image(image: AssetImage('assets/images/findtrips.png'), height: 25),
            label: 'Find Trips',
          ),
          BottomNavigationBarItem(
            icon: Image(image: AssetImage('assets/images/friends.png'), height: 25),
            label: 'Friends',
          ),
        ],
        currentIndex: _selectedIndex,
        //selectedItemColor: Color.fromARGB(255, 246, 246, 245),
        onTap: _onItemTapped,
      ),
    )
    );
  }
}