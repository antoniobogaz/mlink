import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:mlink_app/views/loginPage.dart';

class signInPage extends StatefulWidget {
  const signInPage({super.key});

  @override
  State<signInPage> createState() => _signInPageState();
}

class _signInPageState extends State<signInPage> {
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
                          margin: EdgeInsets.only(top: 0, right: 40, left: 10),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.person),
                              hintText: 'Type your Email',
                              labelText: 'E-mail',
                            ),
                            onChanged: (value) {},
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 0, right: 40, left: 10),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.key),
                              hintText: 'Type your Password',
                              labelText: 'Password',
                            ),
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, right: 0),
                          child: ElevatedButton(
                            child: Text('Sign in'),
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
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, right: 0),
                          child: TextButton(
                            child: Text('I already have an account, login'),
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
