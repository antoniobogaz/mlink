import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:mlink_app/services/auth_service.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mlink_app/views/ProfilePage.dart';
import 'package:mlink_app/views/feedPage.dart';
import 'package:mlink_app/views/searchPage.dart';
import 'package:provider/provider.dart';

class loginRegisterPage extends StatefulWidget {
  const loginRegisterPage({super.key});

  @override
  State<loginRegisterPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginRegisterPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();
  String logo = 'images/Logo_v2_roxa.png';
  bool _obscureText = true;

  bool isLogin = true;
  late String titulo;
  late String actionButton;
  late String toggleButton;
  late String tituloAppBar;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool acao) {
    setState(() {
      isLogin = acao;
      if (isLogin) {
        tituloAppBar = 'Login';
        titulo = 'Bem-vindo';
        actionButton = 'Login';
        toggleButton = 'Ainda não tem uma conta? Cadastre-se';
      } else {
        tituloAppBar = 'Cadastro';
        titulo = 'Crie sua conta';
        actionButton = 'cadastrar';
        toggleButton = 'Já tem uma conta? Login';
      }
    });
  }

  login() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().login(email.text, senha.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  registrar() async {
    setState(() => loading = true);
    try {
      await context
          .read<AuthService>()
          .registrar(context, email.text, senha.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
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
          tituloAppBar,
          style:
              TextStyle(color: Color.fromARGB(255, 139, 92, 235), fontSize: 28),
        ),
        centerTitle: true, //aqui vai o nome do usuário
      ),
      backgroundColor: Color.fromARGB(255, 139, 92, 235),
      body: SingleChildScrollView(
        reverse: true,
        child: Form(
          key: formKey,
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
                          titulo,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: (loading)
                          ? [
                              Padding(
                                padding: EdgeInsets.all(16),
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ]
                          : [
                              InkWell(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    if (isLogin) {
                                      login();
                                    } else {
                                      registrar();
                                    }
                                  }
                                  /*Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => feedPage()));*/
                                },
                                child: Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width / 1.3,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      actionButton.toUpperCase(),
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 139, 92, 235),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                    ),
                    TextButton(
                        onPressed: () => setFormAction(!isLogin),
                        child: Text(
                          toggleButton,
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
