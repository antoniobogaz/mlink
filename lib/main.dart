import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mlink_app/views/editProfile.dart';
import 'package:mlink_app/views/feedPage.dart';
import 'package:mlink_app/views/profilePage.dart';
import 'package:mlink_app/views/searchPage.dart';
import 'package:mlink_app/views/startScreen.dart';
import 'package:mlink_app/views/likedProfile.dart';
import 'package:mlink_app/views/newPost.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: startScreen(),
      routes: {
        '/feedPage': (context) => feedPage(),
        '/profilePage': (context) => profilePage(),
        '/search': (context) => searchPage(),
        '/likedProfile': (context) => likedProfile(),
        '/newPost': (context) => newPostPage(),
      },
    );
  }
}
