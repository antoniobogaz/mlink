import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mlink_app/widgets/bottom_nav_bar.dart';

class searchPage extends StatefulWidget {
  const searchPage({super.key});

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  String name = "";
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
            onChanged: (val) {
              setState(() {
                name = val;
              });
            },
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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('usuarios').snapshots(),
        builder: (context, snapshots) {
          return (snapshots.connectionState == ConnectionState.waiting)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: snapshots.data!.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshots.data!.docs[index].data()
                        as Map<String, dynamic>;

                    if (name.isEmpty) {
                      return ListTile(
                        title: Text(
                          data['nome_usuario'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          data['descricao'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black38,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://s2-techtudo.glbimg.com/1o2J-rf2G9qtlQlm82gaq-mFBec=/0x129:1024x952/924x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2023/7/i/ME2AxRRoygUyFPCDe0jQ/3.png'),
                        ),
                      );
                    }
                    if (data['nome_usuario']
                        .toString()
                        .toLowerCase()
                        .startsWith(name.toLowerCase())) {
                      return ListTile(
                        title: Text(
                          data['nome_usuario'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          data['descricao'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black38,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://s2-techtudo.glbimg.com/1o2J-rf2G9qtlQlm82gaq-mFBec=/0x129:1024x952/924x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2023/7/i/ME2AxRRoygUyFPCDe0jQ/3.png'),
                        ),
                      );
                    }
                    return Container();
                  });
        },
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: _currentIndex),
    );
  }
}
