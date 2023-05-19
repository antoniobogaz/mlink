import 'package:flutter/material.dart';
import 'package:mlink_app/widgets/bottom_nav_bar.dart';

class searchPage extends StatefulWidget {
  const searchPage({super.key});

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  final TextEditingController _controller = TextEditingController();
  int _currentIndex = 1;

  /*void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        backgroundColor: Color.fromARGB(255, 139, 92, 235),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          height: 45,
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              //border: InputBorder.none,
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: IconButton(
                  icon: Icon(Icons.clear,
                      color: Color.fromARGB(255, 139, 92, 235)),
                  onPressed: () {
                    setState(() {
                      _controller.clear();
                    });
                  },
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              border: /*InputBorder.none,*/
                  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none),
              hintText: 'Pesquisar',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            ),
          ),
        ),
      ),
      body: Container(),
      bottomNavigationBar: BottomNavBar(currentIndex: _currentIndex),
    );
  }
}
