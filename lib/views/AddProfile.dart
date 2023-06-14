import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mlink_app/views/feedPage.dart';
import 'package:mlink_app/views/searchPage.dart';
import 'package:mlink_app/services/firebase_crud.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:mlink_app/views/profilePage.dart';

class AddProfile extends StatefulWidget {
  const AddProfile({super.key});

  @override
  State<AddProfile> createState() => _AddProfileState();
}

@override
class _AddProfileState extends State<AddProfile> {
  //final controller = TextEditingController();
  final _nome_usuario = TextEditingController();
  final _descricao = TextEditingController();
  final _telefone = TextEditingController();
  final _celular = TextEditingController();
  final _email = TextEditingController();
  final _primeira_palavra_chave = TextEditingController();
  final _segunda_palavra_chave = TextEditingController();
  final _terceira_palavra_chave = TextEditingController();
  final _quarta_palavra_chave = TextEditingController();
  final _quinta_palavra_chave = TextEditingController();
  final _sexta_palavra_chave = TextEditingController();
  final _biografia = TextEditingController();

  /*MaskedTextController maskedControllerTelefone =
      MaskedTextController(mask: '(00) 0000-0000', text: _telefone);*/

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 139, 92, 235),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 5.9,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 139, 92, 235),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Crie seu Perfil',
                          style: TextStyle(color: Colors.white, fontSize: 39, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Adicione informações para os outros saberem mais sobre você',
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Identificação'.toUpperCase(),
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 50,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
                  child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
                    ],
                    controller: _nome_usuario,
                    maxLength: 50,
                    autofocus: false,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                        border: InputBorder.none,
                        //icon: Icon(Icons.email, color: Colors.grey),
                        hintText: 'Como as pessoas verão seu nome?'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Este campo é obrigatório';
                      }
                    },
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 50,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
                  child: TextFormField(
                    controller: _descricao,
                    maxLength: 40,
                    autofocus: false,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                        border: InputBorder.none,
                        //icon: Icon(Icons.email, color: Colors.grey),
                        hintText: 'Informe uma breve descrição sobre você'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Este campo é obrigatório';
                      }
                    },
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Contato'.toUpperCase(),
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 50,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _telefone,
                    maxLength: 12,
                    //inputFormatters: [maskController.maskedControllerTelefone],
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                        border: InputBorder.none,
                        //icon: Icon(Icons.email, color: Colors.grey),
                        hintText: 'Informe seu número de Telefone'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Este campo é obrigatório';
                      }
                    },
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 50,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _celular,
                    maxLength: 13,
                    autofocus: false,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                        border: InputBorder.none,
                        //icon: Icon(Icons.email, color: Colors.grey),
                        hintText: 'Informe seu número de Celular'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Este campo é obrigatório';
                      }
                    },
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 50,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _email,
                    autofocus: false,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        //icon: Icon(Icons.email, color: Colors.grey),
                        hintText: 'Informe seu Email'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Este campo é obrigatório';
                      }
                    },
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Palavras-Chave'.toUpperCase(),
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Informe palavras relacionadas ao seu perfil',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2.4,
                          height: 45,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Colors.white,
                              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
                          child: TextFormField(
                            controller: _primeira_palavra_chave,
                            maxLength: 12,
                            autofocus: false,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                                border: InputBorder.none,
                                //icon: Icon(Icons.email, color: Colors.grey),
                                hintText: '1ª Palavra-Chave'),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Este campo é obrigatório';
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          width: MediaQuery.of(context).size.width / 2.4,
                          height: 45,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Colors.white,
                              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
                          child: TextFormField(
                            controller: _segunda_palavra_chave,
                            autofocus: false,
                            maxLength: 12,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                                border: InputBorder.none,
                                //icon: Icon(Icons.email, color: Colors.grey),
                                hintText: '2ª Palavra-Chave'),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Este campo é obrigatório';
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          width: MediaQuery.of(context).size.width / 2.4,
                          height: 45,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Colors.white,
                              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
                          child: TextFormField(
                            controller: _terceira_palavra_chave,
                            maxLength: 12,
                            autofocus: false,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                                border: InputBorder.none,
                                //icon: Icon(Icons.email, color: Colors.grey),
                                hintText: '3ª Palavra-Chave'),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Este campo é obrigatório';
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2.4,
                          height: 45,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Colors.white,
                              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
                          child: TextFormField(
                            maxLength: 12,
                            controller: _quarta_palavra_chave,
                            autofocus: false,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                                border: InputBorder.none,
                                //icon: Icon(Icons.email, color: Colors.grey),
                                hintText: '4ª Palavra-Chave'),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Este campo é obrigatório';
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          width: MediaQuery.of(context).size.width / 2.4,
                          height: 45,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Colors.white,
                              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
                          child: TextFormField(
                            maxLength: 12,
                            controller: _quinta_palavra_chave,
                            autofocus: false,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                                border: InputBorder.none,
                                //icon: Icon(Icons.email, color: Colors.grey),
                                hintText: '5ª Palavra-Chave'),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Este campo é obrigatório';
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          width: MediaQuery.of(context).size.width / 2.4,
                          height: 45,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Colors.white,
                              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
                          child: TextFormField(
                            controller: _sexta_palavra_chave,
                            maxLength: 12,
                            autofocus: false,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                                border: InputBorder.none,
                                //icon: Icon(Icons.email, color: Colors.grey),
                                hintText: '6ª Palavra-Chave'),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Este campo é obrigatório';
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  'Biografia'.toUpperCase(),
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 300,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
                  child: TextFormField(
                    maxLines: null,
                    controller: _biografia,
                    maxLength: 500,
                    autofocus: false,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        //icon: Icon(Icons.email, color: Colors.grey),
                        hintText: 'Conte um pouco sobre sua relação com a música...'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Este campo é obrigatório';
                      }
                    },
                  ),
                ),
                SizedBox(height: 50),
                InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      var response = await FirebaseCrud.addUsuarios(
                          nomeUsuario: _nome_usuario.text,
                          descricao: _descricao.text,
                          telefone: _telefone.text,
                          celular: _celular.text,
                          email: _email.text,
                          primeiraPalavraChave: _primeira_palavra_chave.text,
                          segundaPalavraChave: _segunda_palavra_chave.text,
                          terceiraPalavraChave: _terceira_palavra_chave.text,
                          quartaPalavraChave: _quarta_palavra_chave.text,
                          quintaPalavraChave: _quinta_palavra_chave.text,
                          sextaPalavraChave: _sexta_palavra_chave.text,
                          biografia: _biografia.text);
                      if (response.codigo != 200) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text(response.mensagem.toString()),
                              );
                            });
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Salvo com sucesso!'),
                                content: Text(response.mensagem.toString()),
                                actions: [
                                  TextButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) {
                                        return feedPage();
                                      })));
                                    },
                                  )
                                ],
                              );
                            });
                      }
                    }
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
                        'Salvar informações'.toUpperCase(),
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
