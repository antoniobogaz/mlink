import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mlink_app/views/searchPage.dart';
import 'package:mlink_app/widgets/bottom_nav_bar.dart';
import 'package:mlink_app/views/profilePageOthers.dart';

class feedPage extends StatefulWidget {
  const feedPage({super.key});

  @override
  State<feedPage> createState() => _feedPageState();
}

@override
class _feedPageState extends State<feedPage> {
  int _currentIndex = 0;

  /*void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 191, 173, 226),
      appBar: AppBar(
        elevation: 5.0,
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 139, 92, 235),
        title: Text(
          'Musical Link',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => searchPage()),
                );
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: ListView.builder(
          itemCount: 12, itemBuilder: ((context, index) => CardItem())),
      bottomNavigationBar: BottomNavBar(currentIndex: _currentIndex),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Card(
        //margin: EdgeInsets.only(right: 7, left: 7),
        child: Container(
          height: 330.0,
          //color: Colors.red,
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 9, top: 5),
                      child: InkWell(
                        onTap: () {},
                        child: CircleAvatar(
                          backgroundImage: const NetworkImage(
                            'https://images.pexels.com/photos/167378/pexels-photo-167378.jpeg?auto=compress&cs=tinysrgb&w=400',
                          ),
                        ),
                      )),
                  //SizedBox(width: 2),
                  Container(
                    margin: EdgeInsets.only(left: 9, top: 9),
                    child: Text(
                      'Daniel da Silva',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ),
                  SizedBox(width: 140),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              'Curtir Perfil',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 8),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://images.pexels.com/photos/196652/pexels-photo-196652.jpeg?auto=compress&cs=tinysrgb&w=400'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      //color: Colors.blue,
                    ),
                    /*Positioned(
                      bottom: 16.0,
                      right: 16.0,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.favorite_border_rounded,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    )*/
                  ],
                ),
              ),
              SizedBox(height: 5.0),
            ],
          ),
        ),
      ),
    );
  }
}
