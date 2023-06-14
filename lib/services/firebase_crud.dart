import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mlink_app/models/response.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('usuarios');

class FirebaseCrud {
  static Future<Response> addUsuarios({
    required String nomeUsuario,
    required String descricao,
    required String telefone,
    required String celular,
    required String email,
    required String primeiraPalavraChave,
    required String segundaPalavraChave,
    required String terceiraPalavraChave,
    required String quartaPalavraChave,
    required String quintaPalavraChave,
    required String sextaPalavraChave,
    required String biografia,
  }) async {
    Response response = Response();
    //DocumentReference documentReferencer = _Collection.doc();
    User? user = FirebaseAuth.instance.currentUser;
    String uid = user!.uid;

    DocumentReference documentReferencer = _Collection.doc(uid);

    Map<String, dynamic> data = <String, dynamic>{
      "nome_usuario": nomeUsuario,
      "descricao": descricao,
      "telefone": telefone,
      "celular": celular,
      "email": email,
      "primeira_palavra_chave": primeiraPalavraChave,
      "segunda_palavra_chave": segundaPalavraChave,
      "terceira_palavra_chave": terceiraPalavraChave,
      "quarta_palavra_chave": quartaPalavraChave,
      "quinta_palavra_chave": quintaPalavraChave,
      "sexta_palavra_chave": sextaPalavraChave,
      "biografia": biografia
    };

    /*var result = await documentReferencer.set(data).whenComplete(() {
      response.codigo = 200;
      response.mensagem = 'Adicionado com sucesso';
    }).catchError((e) {
      response.codigo = 500;
      response.mensagem = e;
    });*/
    try {
      await documentReferencer.set(data).whenComplete(() {
        response.codigo = 200;
        response.mensagem = 'Adicionado com sucesso';
      });
    } catch (e) {
      response.codigo = 500;
      response.mensagem = e.toString();
    }

    return response;
  }

  static Future<Response> updateUsuarios({
    required String nomeUsuario,
    required String descricao,
    required String telefone,
    required String celular,
    required String email,
    required String primeiraPalavraChave,
    required String segundaPalavraChave,
    required String terceiraPalavraChave,
    required String quartaPalavraChave,
    required String quintaPalavraChave,
    required String sextaPalavraChave,
    required String biografia,
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "nome_usuario": nomeUsuario,
      "descricao": descricao,
      "telefone": telefone,
      "celular": celular,
      "email": email,
      "primeira_palavra_chave": primeiraPalavraChave,
      "segunda_palavra_chave": segundaPalavraChave,
      "terceira_palavra_chave": terceiraPalavraChave,
      "quarta_palavra_chave": quartaPalavraChave,
      "quinta_palavra_chave": quintaPalavraChave,
      "sexta_palavra_chave": sextaPalavraChave,
      "biografia": biografia
    };

    await documentReferencer.update(data).whenComplete(() {
      response.codigo = 200;
      response.mensagem = "Alterado com sucesso";
    }).catchError((e) {
      response.codigo = 500;
      response.mensagem = e;
    });

    return response;
  }

  static Stream<QuerySnapshot> readUsuarios() {
    CollectionReference notesItemCollection = _Collection;

    return notesItemCollection.snapshots();
  }

  static Future<Response> deleteUsuario({
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc(docId);

    await documentReferencer.delete().whenComplete(() {
      response.codigo = 200;
      response.mensagem = "Deletado com Sucesso!";
    }).catchError((e) {
      response.codigo = 500;
      response.mensagem = e;
    });

    return response;
  }
}
