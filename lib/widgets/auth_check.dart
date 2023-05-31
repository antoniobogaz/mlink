import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mlink_app/services/auth_service.dart';
import 'package:mlink_app/views/AddProfile.dart';
import 'package:mlink_app/views/loginRegister.dart';
import 'package:provider/provider.dart';
import 'package:mlink_app/views/feedPage.dart';

class AuthCheck extends StatefulWidget {
  AuthCheck({Key? key}) : super(key: key);

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if (auth.isLoading)
      return loading();
    else if (auth.usuario == null)
      return loginRegisterPage();
    else
      return feedPage();
  }

  loading() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
