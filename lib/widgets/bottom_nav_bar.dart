import 'package:flutter/material.dart';
import 'package:mlink_app/views/likedProfile.dart';

class BottomNavBar extends StatefulWidget {
  final int currentIndex;
  //final void Function(int) onTap;

  BottomNavBar({required this.currentIndex});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.my_library_music),
      label: 'Feed',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Busca',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add),
      label: 'Novo',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Curtidas',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      label: 'Perfil',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _bottomNavBarItems,
      currentIndex: widget.currentIndex,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/feedPage');
            break;
          case 1:
            Navigator.pushNamed(context, '/search');
            break;
          case 2:
            Navigator.pushNamed(context, '/newPost');
            break;
          case 3:
            Navigator.pushNamed(context, '/likedProfile');
            break;
          case 4:
            Navigator.pushNamed(context, '/profilePage');
            break;
        }
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Color.fromARGB(255, 139, 92, 235),
      elevation: 0,
    );
  }
}
