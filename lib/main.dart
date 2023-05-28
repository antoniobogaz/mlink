import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mlink_app/services/auth_service.dart';
//import 'package:mlink_app/views/editProfile.dart';
import 'package:mlink_app/views/feedPage.dart';
import 'package:mlink_app/views/profilePage.dart';
import 'package:mlink_app/views/searchPage.dart';
import 'package:mlink_app/views/likedProfile.dart';
import 'package:mlink_app/views/newPost.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mlink_app/widgets/auth_check.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  try {
    await Firebase.initializeApp();
    // Conexão com o Firebase foi estabelecida com sucesso
  } catch (e) {
    print('Erro ao inicializar o Firebase: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthCheck(),
        routes: {
          '/feedPage': (context) => feedPage(),
          '/profilePage': (context) => profilePage(),
          '/search': (context) => searchPage(),
          '/likedProfile': (context) => likedProfile(),
          '/newPost': (context) => newPostPage(),
        },
      ),
    );
  }
}
