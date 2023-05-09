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
  String logo = 'images/logo.jfif';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Color.fromARGB(255, 28, 28, 28),
      ),
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                height: 500,
                width: 300,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 0, right: 0),
                      child: Center(
                        child: Image.asset(
                          logo,
                          height: 250,
                          width: 250,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50, right: 0),
                          child: ElevatedButton(
                            child: Text('Login'),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => loginPage()));
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 40, right: 0),
                          child: ElevatedButton(
                            child: Text('Sign In'),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => signInPage()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
