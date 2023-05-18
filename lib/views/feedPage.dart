import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mlink_app/views/searchPage.dart';
import 'package:mlink_app/widgets/bottom_nav_bar.dart';

class feedPage extends StatefulWidget {
  const feedPage({super.key});

  @override
  State<feedPage> createState() => _feedPageState();
}

@override
class _feedPageState extends State<feedPage> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(250, 215, 216, 215),
      appBar: AppBar(
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
      bottomNavigationBar:
          BottomNavBar(currentIndex: _currentIndex, onTap: _onItemTapped),
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
        margin: EdgeInsets.only(right: 11, left: 11),
        child: Container(
          height: 330.0,
          //color: Colors.red,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(),
                title: Text('Daniel da Silva'),
                subtitle: Text('Função de tempo'),
              ),
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
                    Positioned(
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
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
