import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:mlink_app/services/auth_service.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mlink_app/views/signInPage.dart';
import 'package:mlink_app/views/ProfilePage.dart';
import 'package:mlink_app/views/feedPage.dart';
import 'package:mlink_app/views/searchPage.dart';
import 'package:provider/provider.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();
  String logo = 'images/Logo_v2_roxa.png';
  bool _obscureText = true;

  //bool isLogin = true;

  login() async {
    try {
      await context.read<AuthService>().login(email.text, senha.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'Login',
          style:
              TextStyle(color: Color.fromARGB(255, 139, 92, 235), fontSize: 28),
        ),
        centerTitle: true, //aqui vai o nome do usuário
      ),
      backgroundColor: Color.fromARGB(255, 139, 92, 235),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(150),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      logo,
                      height: 210,
                      width: 210,
                    ),
                  ),
                  //Spacer(),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 17, left: 32),
                      child: Text(
                        'Vamos lá',
                        style: TextStyle(
                            color: Color.fromARGB(255, 139, 92, 235),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2.4,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 72),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    height: 50,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.email, color: Colors.grey),
                          hintText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe o email corretamente!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    height: 50,
                    margin: EdgeInsets.only(top: 32),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextFormField(
                      controller: senha,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Senha',
                        icon: Icon(Icons.password, color: Colors.grey),
                        suffixIcon: IconButton(
                          icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informa sua senha!';
                        } else if (value.length < 6) {
                          return 'Sua senha deve ter no mínimo 6 caracteres';
                        }
                        return null;
                      },
                    ),
                  ),
                  /*Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12, right: 70),
                      child: Text(
                        'Esqueceu a senha?',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),*/
                  Spacer(),
                  InkWell(
                    onTap: () {
                      /*if (formKey.currentState!.validate()) {
                        login();
                      }*/
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => feedPage()));
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 1.3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Login'.toUpperCase(),
                          style: TextStyle(
                              color: Color.fromARGB(255, 139, 92, 235),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  //Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signInPage()));
                          },
                          child: Text(
                            'Não tem uma conta? Cadastre-se',
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
