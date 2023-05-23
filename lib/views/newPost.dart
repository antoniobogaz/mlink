import 'package:flutter/material.dart';
import 'package:mlink_app/widgets/bottom_nav_bar.dart';
//import 'package:mlink_app/views/likedProfile.dart';

class newPostPage extends StatefulWidget {
  const newPostPage({super.key});

  @override
  State<newPostPage> createState() => _newPostPageState();
}

class _newPostPageState extends State<newPostPage> {
  //final TextEditingController _controller = TextEditingController();
  int _currentIndex = 2;

  /*void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 139, 92, 235),
        title: Text(
          'Nova Postagem',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(top: 60),
                height: 50,
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 139, 92, 235),
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Escolher Imagem'.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(top: 60),
                height: 50,
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 139, 92, 235),
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Carregar Imagem'.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: _currentIndex),
    );
  }
}
