import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mlink_app/widgets/numbers_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mlink_app/views/editProfile.dart';
import 'package:mlink_app/views/searchPage.dart';
import 'package:mlink_app/widgets/bottom_nav_bar.dart';
import 'package:mlink_app/views/newPost.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  /*--------------------------------------------------------------------------*/
  Future<File?> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      return File(pickedImage.path);
    }

    return null;
  }

  /*--------------------------------------------------------------------------*/
  Future<void> uploadProfileImage(File imageFile) async {
    //obtém o usuário atualmente autenticado
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      //define o caminho de armazenamento com o UID do usuário
      String storagePath = 'profile_images/${user.uid}/${DateTime.now().millisecondsSinceEpoch}.jpg';

      try {
        //faz o upload da imagem para o Firebase Storage
        await FirebaseStorage.instance.ref(storagePath).putFile(imageFile);

        //atualiza o campo de foto de perfil do usuário com o caminho da imagem no Storage
        String imageUrl = await FirebaseStorage.instance.ref(storagePath).getDownloadURL();
        await user.updatePhotoURL(imageUrl);

        print('Imagem de perfil enviada com sucesso.');
      } catch (e) {
        print('Erro ao enviar imagem de perfil: $e');
      }
    } else {
      print('Usuário não autenticado.');
    }
  }

  /*--------------------------------------------------------------------------*/
  Future<String?> getProfileImageUrl() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String storagePath = 'profile_images/${user.uid}/'; // caminho da pasta do usuário

      try {
        // Lista os arquivos dentro da pasta do usuário
        ListResult result = await FirebaseStorage.instance.ref(storagePath).listAll();

        // Verifica se há algum arquivo na pasta
        if (result.items.isNotEmpty) {
          // Classifica os arquivos com base no campo de data/hora no nome do arquivo em ordem decrescente
          result.items.sort((a, b) => b.name.compareTo(a.name));

          // Obtém o primeiro arquivo (neste caso, a imagem mais recente)
          Reference imageRef = result.items.last;

          // Obtém o URL da imagem
          String imageUrl = await imageRef.getDownloadURL();

          return imageUrl;
        } else {
          // Não há imagem de perfil para o usuário
          return null;
        }
      } catch (e) {
        print('Erro ao buscar imagem de perfil: $e');
        return null;
      }
    } else {
      print('Usuário não autenticado.');
      return null;
    }
  }

/*----------------------------------------------------------------------------*/
  Future<void> uploadCoverImage(File imageFile) async {
    //obtém o usuário atualmente autenticado
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      //define o caminho de armazenamento com o UID do usuário
      String storagePath = 'cover_images/${user.uid}/${DateTime.now().millisecondsSinceEpoch}.jpg';

      try {
        //faz o upload da imagem para o Firebase Storage
        await FirebaseStorage.instance.ref(storagePath).putFile(imageFile);

        //atualiza o campo de foto de perfil do usuário com o caminho da imagem no Storage
        String imageUrl = await FirebaseStorage.instance.ref(storagePath).getDownloadURL();
        await user.updatePhotoURL(imageUrl);

        print('Imagem de capa enviada com sucesso.');
      } catch (e) {
        print('Erro ao enviar imagem de capa: $e');
      }
    } else {
      print('Usuário não autenticado.');
    }
  }

  /*--------------------------------------------------------------------------*/
  Future<String?> getCoverImageUrl() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String storagePath = 'cover_images/${user.uid}/'; // caminho da pasta do usuário

      try {
        // Lista os arquivos dentro da pasta do usuário
        ListResult result = await FirebaseStorage.instance.ref(storagePath).listAll();

        // Verifica se há algum arquivo na pasta
        if (result.items.isNotEmpty) {
          // Classifica os arquivos com base no campo de data/hora no nome do arquivo em ordem decrescente
          result.items.sort((a, b) => b.name.compareTo(a.name));

          // Obtém o primeiro arquivo (neste caso, a imagem mais recente)
          Reference imageRef = result.items.last;

          // Obtém o URL da imagem
          String imageUrl = await imageRef.getDownloadURL();

          return imageUrl;
        } else {
          // Não há imagem de perfil para o usuário
          return null;
        }
      } catch (e) {
        print('Erro ao buscar imagem de capa: $e');
        return null;
      }
    } else {
      print('Usuário não autenticado.');
      return null;
    }
  }

  final double coverHeight = 230;
  final double profileHeight = 144;
  int _currentIndex = 4;
  String uid = FirebaseAuth.instance.currentUser!.uid;
  Map<String, dynamic> userData = {};

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('usuarios').doc(uid).get();

    if (snapshot.exists) {
      setState(() {
        userData = snapshot.data() as Map<String, dynamic>;
      });
    }
  }

  final urlImages = [
    'https://cbissn.ibict.br/images/phocagallery/galeria2/thumbs/phoca_thumb_l_image03_grd.png',
    'https://cbissn.ibict.br/images/phocagallery/galeria2/thumbs/phoca_thumb_l_image03_grd.png',
    'https://cbissn.ibict.br/images/phocagallery/galeria2/thumbs/phoca_thumb_l_image03_grd.png'
  ];

  @override
  Widget build(BuildContext context) {
    //final top = coverHeight - profileHeight / 2;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 139, 92, 235),
        title: Text(
          '${userData['nome_usuario'] ?? ''}',
        ),
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
                    //autoPlay: true,
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
          FutureBuilder<String?>(
            future: getCoverImageUrl(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  color: Colors.grey,
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (snapshot.hasError) {
                return Container(
                  color: Colors.grey,
                  child: Text('Erro ao carregar a imagem de capa'),
                );
              } else if (snapshot.hasData && snapshot.data != null) {
                return Container(
                  color: Colors.grey,
                  child: Image.network(
                    snapshot.data!,
                    width: double.infinity,
                    height: coverHeight,
                    fit: BoxFit.cover,
                  ),
                );
              } else {
                return Container(
                  color: Colors.grey,
                );
              }
            },
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
                onPressed: () async {
                  File? imageFile = await pickImage();
                  if (imageFile != null) {
                    await uploadCoverImage(imageFile);
                  } else {
                    print('nenhuma imagem selecionada.');
                  }
                },
              ),
            ),
          ),
        ],
      );

  Widget buildProfileImage() => Stack(
        children: [
          FutureBuilder<String?>(
            future: getProfileImageUrl(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Enquanto o URL da imagem está sendo buscado, exibe um indicador de carregamento
                return Container(child: Center(child: CircularProgressIndicator()));
              } else if (snapshot.hasError) {
                // Em caso de erro ao buscar o URL da imagem
                return Container(child: Text('Erro ao carregar a imagem de perfil'));
              } else if (snapshot.hasData && snapshot.data != null) {
                // Se o URL da imagem for válido, exibe a imagem usando o CircleAvatar
                return CircleAvatar(
                  radius: profileHeight / 2,
                  backgroundColor: Colors.red,
                  backgroundImage: NetworkImage(snapshot.data!),
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
              } else {
                // Se não houver imagem de perfil para o usuário, exibe um ícone ou imagem padrão
                return CircleAvatar(
                  radius: profileHeight / 2,
                  backgroundColor: Colors.red,
                  child: Icon(Icons.account_circle, size: profileHeight),
                );
              }
            },
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
                onPressed: () async {
                  File? imageFile = await pickImage();
                  if (imageFile != null) {
                    uploadProfileImage(imageFile);
                  } else {
                    print('nenhuma imagem selecionada.');
                  }
                },
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
                '${userData['nome_usuario'] ?? ''}',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                '${userData['descricao'] ?? ''}',
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
                            '${userData['primeira_palavra_chave'] ?? ''}'.toUpperCase(),
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                            '${userData['segunda_palavra_chave'] ?? ''}'.toUpperCase(),
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                            '${userData['terceira_palavra_chave'] ?? ''}'.toUpperCase(),
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                            '${userData['quarta_palavra_chave'] ?? ''}'.toUpperCase(),
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                            '${userData['quinta_palavra_chave'] ?? ''}'.toUpperCase(),
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                            '${userData['sexta_palavra_chave'] ?? ''}'.toUpperCase(),
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                  '${userData['telefone'] ?? ''}',
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
                Text('${userData['celular'] ?? ''}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ],
            ),
            Row(
              children: [
                Text(
                  'Email: ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text('${userData['email'] ?? ''}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
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
                      '${userData['biografia'] ?? ''}',
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
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
}
