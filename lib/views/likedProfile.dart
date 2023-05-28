import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:mlink_app/views/searchPage.dart';
import 'package:mlink_app/widgets/bottom_nav_bar.dart';
//import 'package:mlink_app/views/profilePageOthers.dart';

class likedProfile extends StatefulWidget {
  const likedProfile({super.key});

  @override
  State<likedProfile> createState() => _likedProfileState();
}

@override
class _likedProfileState extends State<likedProfile> {
  int _currentIndex = 3;

  /*void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 139, 92, 235),
        title: Text(
          'Curtidos',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
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
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Card(
        color: Color.fromARGB(255, 139, 92, 235),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          /*side: BorderSide(
          color: Color.fromARGB(255, 139, 92, 235),
          width: 2,
        )*/
        ),
        //margin: EdgeInsets.only(right: 7, left: 7),
        child: Container(
          height: 130.0,

          //color: Colors.red,
          child: Row(
            children: <Widget>[
              Container(
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://images.pexels.com/photos/167378/pexels-photo-167378.jpeg?auto=compress&cs=tinysrgb&w=400'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5, right: 90),
                      child: Text(
                        'Daniel da Silva',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 40.0, top: 20),
                      child: Row(
                        children: [
                          SizedBox(width: 4),
                          Text(
                            'Telefone:',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              '(17) 3261-4598',
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, right: 40),
                      child: Row(
                        children: [
                          SizedBox(width: 4),
                          Text(
                            'Celular:',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              '(17) 99245-1286',
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, right: 15),
                      child: Row(
                        children: [
                          SizedBox(width: 4),
                          Text(
                            'Email:',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          Expanded(
                            child: Text(
                              'DanielSilva@gmail.com',
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  //SizedBox(width: 128),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 91.0),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 39,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 0, 0),
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.thumb_up_alt_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(width: 3),
                            /*Text(
                              'Descurtir Perfil',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),*/
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 6),
              SizedBox(height: 8.0),
            ],
          ),
        ),
      ),
    );
  }
}
