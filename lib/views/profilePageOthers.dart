import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mlink_app/views/loginPage.dart';
import 'package:mlink_app/widgets/numbers_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mlink_app/views/editProfile.dart';
import 'package:mlink_app/views/searchPage.dart';
import 'package:mlink_app/widgets/bottom_nav_bar.dart';
import 'package:mlink_app/views/feedPage.dart';

class profilePageOthers extends StatefulWidget {
  const profilePageOthers({super.key});

  @override
  State<profilePageOthers> createState() => _profilePageOthersState();
}

class _profilePageOthersState extends State<profilePageOthers> {
  final double coverHeight = 230;
  final double profileHeight = 144;
  /*int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    //final top = coverHeight - profileHeight / 2;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 139, 92, 235),
        title: Text('Daniel da Silva'),
        centerTitle: true, //aqui vai o nome do usuário
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
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
      body: ListView(
        children: <Widget>[
          Column(
            children: [
              buildTop(),
              buildContent(),
            ],
          ),
        ],
      ),
      //bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget buildTop() {
    final bottom = profileHeight / 1.9;
    final top = coverHeight - profileHeight / 1.4;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(),
        )
      ],
    );
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.network(
            'https://images.pexels.com/photos/994605/pexels-photo-994605.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            width: double.infinity,
            height: coverHeight,
            fit: BoxFit.cover),
      );

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.red,
        backgroundImage: const NetworkImage(
          'https://images.pexels.com/photos/167378/pexels-photo-167378.jpeg?auto=compress&cs=tinysrgb&w=400',
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Color.fromARGB(255, 139, 92, 235),
              width: 5.0,
            ),
          ),
        ),
      );

  Widget buildContent() => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Daniel da Silva',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                'Cantor, compositor e músico',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w300),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildSocialIcon(FontAwesomeIcons.facebook),
                const SizedBox(width: 15),
                buildSocialIcon(FontAwesomeIcons.instagram),
                const SizedBox(width: 12),
                buildSocialIcon(FontAwesomeIcons.twitter),
                const SizedBox(width: 12),
                buildSocialIcon(FontAwesomeIcons.whatsapp),
                const SizedBox(width: 12),
                buildSocialIcon(FontAwesomeIcons.spotify),
              ],
            ),
            const SizedBox(height: 23),
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width / 4.3,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          color: Color.fromARGB(255, 139, 92, 235),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'instrumento'.toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width / 4.3,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          color: Color.fromARGB(255, 139, 92, 235),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'festivais'.toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width / 4.3,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          color: Color.fromARGB(255, 139, 92, 235),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'composição'.toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width / 4.3,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          color: Color.fromARGB(255, 139, 92, 235),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'gravadoras'.toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width / 4.3,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          color: Color.fromARGB(255, 139, 92, 235),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'expressão'.toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width / 4.3,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          color: Color.fromARGB(255, 139, 92, 235),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'ritmo'.toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            //const SizedBox(height: 1),
            const Divider(
              color: Color.fromARGB(255, 139, 92, 235),
            ),
            const SizedBox(height: 16),
            NumberWidget(),
            const SizedBox(height: 16),
            const Divider(
              color: Color.fromARGB(255, 139, 92, 235),
            ),
            const SizedBox(height: 16),
            //buildAbout(),
            const SizedBox(height: 20),
            //const SizedBox(height: 30),
            Center(
              child: Text(
                'Contato',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'Telefone: ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '(17) 3464-4314',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Celular: ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text('(17) 99256-7842',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ],
            ),
            Row(
              children: [
                Text(
                  'Email: ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text('DanielSilva@gmail.com',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ],
            ),
            /*const Divider(
              color: Color.fromARGB(255, 139, 92, 235),
            ),*/
            const SizedBox(height: 28),
            Center(
              child: Text(
                'Biografia',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Minha história começa quando ganhei meu primeiro instrumento, um violão, aos 10 anos de idade.\nDesde então, eu me dediquei a aprender a tocar vários instrumentos, como guitarra, baixo, bateria e piano. Cresci ouvindo diferentes estilos musicais e sempre busquei incorporar essas influências em minha própria música.',
              style: TextStyle(fontSize: 18, height: 1.4),
            ),
            /*const Divider(
              color: Color.fromARGB(255, 139, 92, 235),
            ),*/
            const SizedBox(height: 28),
            Center(
              child: Text(
                'Mídias',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      );

  Widget buildSocialIcon(IconData icon) => CircleAvatar(
        backgroundColor: Color.fromARGB(255, 139, 92, 235),
        radius: 25,
        child: Material(
          shape: CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: Color.fromARGB(255, 139, 92, 235),
          child: InkWell(
            onTap: () {},
            child: Center(
              child: Icon(icon, size: 32, color: Colors.white),
            ),
          ),
        ),
      );
}
