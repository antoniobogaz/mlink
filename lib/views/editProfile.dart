import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mlink_app/models/usuario.dart';
import 'package:mlink_app/views/AddProfile.dart';
import 'package:mlink_app/views/loginRegister.dart';
import 'package:mlink_app/views/searchPage.dart';
import 'package:mlink_app/services/auth_service.dart';
import 'package:provider/provider.dart';

class editProfile extends StatefulWidget {
  const editProfile({super.key});

  @override
  State<editProfile> createState() => _editProfileState();
}

@override
class _editProfileState extends State<editProfile> {
  final controller = TextEditingController();
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
  final _docid = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Future<bool?> exibirDialogoConfirmacao(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmação'),
          content: Text('Tem certeza de que quer DELETAR SUA CONTA?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop(false); // Retorna false para cancelar a exclusão
              },
            ),
            TextButton(
              child: Text('Excluir'),
              onPressed: () {
                Navigator.of(context).pop(true); // Retorna true para confirmar a exclusão
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> excluirPerfil() async {
    bool? confirmacao = await exibirDialogoConfirmacao(context);

    if (confirmacao == true) {
      try {
        String uid = FirebaseAuth.instance.currentUser!.uid;

        CollectionReference usuariosRef = FirebaseFirestore.instance.collection('usuarios');

        QuerySnapshot querySnapshot = await usuariosRef.get();

        querySnapshot.docs.forEach((document) async {
          if (document.id == uid) {
            await document.reference.delete();
            //print('Documento ${document.id} excluído com sucesso!');
          }
        });
        await FirebaseAuth.instance.currentUser!.delete();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Conta excluída com sucesso!'),
          ),
        );
        Navigator.push(context, MaterialPageRoute(builder: (context) => loginRegisterPage()));
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao excluir documentos: $error'),
          ),
        );
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 139, 92, 235),
      ),
      body: Form(
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
                          'Editar Informações do Perfil',
                          style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
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
                    maxLength: 12,
                    //inputFormatters: [maskController.maskedControllerTelefone],
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                        border: InputBorder.none,
                        //icon: Icon(Icons.email, color: Colors.grey),
                        hintText: 'Informe seu número de Telefone'),
                    /*validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Este campo é obrigatório';
                      }
                    },*/
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
                    maxLength: 13,
                    autofocus: false,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                        border: InputBorder.none,
                        //icon: Icon(Icons.email, color: Colors.grey),
                        hintText: 'Informe seu número de Celular'),
                    /*validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Este campo é obrigatório';
                      }
                    },*/
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
                    autofocus: false,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        //icon: Icon(Icons.email, color: Colors.grey),
                        hintText: 'Informe seu Email'),
                    /*validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Este campo é obrigatório';
                      }
                    },*/
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
                  onTap: () {},
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
                        'Editar Informações'.toUpperCase(),
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    excluirPerfil();
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.3,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 216, 35, 32),
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Apagar Conta'.toUpperCase(),
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
