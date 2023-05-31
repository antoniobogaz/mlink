import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:mlink_app/views/loginPage.dart';
import 'package:mlink_app/widgets/numbers_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mlink_app/views/editProfile.dart';
import 'package:mlink_app/views/searchPage.dart';
import 'package:mlink_app/widgets/bottom_nav_bar.dart';
import 'package:mlink_app/views/newPost.dart';
import 'package:mlink_app/services/firebase_crud.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  final double coverHeight = 230;
  final double profileHeight = 144;
  int _currentIndex = 4;

  final urlImages = [
    'https://cbissn.ibict.br/images/phocagallery/galeria2/thumbs/phoca_thumb_l_image03_grd.png',
    'https://cbissn.ibict.br/images/phocagallery/galeria2/thumbs/phoca_thumb_l_image03_grd.png',
    'https://cbissn.ibict.br/images/phocagallery/galeria2/thumbs/phoca_thumb_l_image03_grd.png'
  ];

  /*void _onItemTapped(int index) {
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
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: [
              buildTop(),
              buildContent(),
              //editProfileButton(),
              Center(
                child: CarouselSlider.builder(
                  itemCount: urlImages.length,
                  itemBuilder: (context, index, realIndex) {
                    final UrlImage = urlImages[index];

                    return buildImage(UrlImage, index);
                  },
                  options: CarouselOptions(
                    height: 400,
                    autoPlay: true,
                    reverse: false,
                    autoPlayInterval: Duration(seconds: 3),
                    enlargeCenterPage: true,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: _currentIndex),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        color: Colors.grey,
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      );

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

  Widget buildCoverImage() => Stack(
        children: [
          Container(
            color: Colors.grey,
            child: Image.network(
                'https://cbissn.ibict.br/images/phocagallery/galeria2/thumbs/phoca_thumb_l_image03_grd.png',
                width: double.infinity,
                height: coverHeight,
                fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 180, left: 360),
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              child: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      );

  Widget buildProfileImage() => Stack(
        children: [
          CircleAvatar(
            radius: profileHeight / 2,
            backgroundColor: Colors.red,
            backgroundImage: const NetworkImage(
              'https://cbissn.ibict.br/images/phocagallery/galeria2/thumbs/phoca_thumb_l_image03_grd.png',
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 110, left: 100),
            child: CircleAvatar(
              backgroundColor: Colors.black45,
              child: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
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
            const SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                newPostButton(),
                SizedBox(width: 12),
                editProfileButton(),
              ],
            ),
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
            Container(),
            Text(
              'Contato',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'Telefone: ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '(17) 3464-43148',
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
            Text(
              'Biografia',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Center(
              child: Container(
                width: 450,
                //height: 400,
                child: Wrap(
                  children: [
                    Text(
                      'Minha história começa quando ganhei meu primeiro instrumento, um violão, aos 10 anos de idade.\nDesde então, eu me dediquei a aprender a tocar vários instrumentos, como guitarra, baixo, bateria e piano. Cresci ouvindo diferentes estilos musicais e sempre busquei incorporar essas influências em minha própria música.',
                      style: TextStyle(fontSize: 18, height: 1.4),
                    ),
                  ],
                ),
              ),
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

  Widget editProfileButton() => InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => editProfile()),
          );
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Container(
              alignment: Alignment.center,
              height: 35,
              width: MediaQuery.of(context).size.width / 2.8,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 216, 218, 221),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 17.0),
                    child: Icon(Icons.edit, color: Colors.white),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'editar perfil'.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget newPostButton() => InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => newPostPage()),
          );
        },
        child: Container(
          alignment: Alignment.center,
          height: 35,
          width: MediaQuery.of(context).size.width / 2.8,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 216, 218, 221),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Icon(Icons.add_a_photo, color: Colors.white),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Adicionar Mídia'.toUpperCase(),
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
}
