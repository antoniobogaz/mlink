import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mlink_app/services/auth_service.dart';
import 'package:mlink_app/views/loginPage.dart';
import 'package:mlink_app/views/startScreen.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget {
  AuthCheck({Key? key}) : super(key: key);

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if (auth.isloading)
      return loading();
    else if (auth.usuario == null)
      return startScreen();
    else
      return loginPage();
  }

  loading() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
