import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mlink_app/views/loginPage.dart';
import 'package:mlink_app/views/signInPage.dart';

class startScreen extends StatefulWidget {
  const startScreen({super.key});

  @override
  State<startScreen> createState() => _startScreenState();
}

class _startScreenState extends State<startScreen> {
  String logo = 'images/Logo_v2_roxa.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 139, 92, 235),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.2,
          height: MediaQuery.of(context).size.height / 2.0,
          //color: Colors.white,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(55),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10),
              Text(
                'Bem-Vindo!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Faça login ou cadastre-se para continuar',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 100),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => loginPage()));
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.3,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 139, 92, 235),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Fazer Login'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => signInPage()),
                  );
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.3,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 139, 92, 235),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Cadastrar-se'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 70),
              Image.asset(
                logo,
                height: 80,
                width: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
