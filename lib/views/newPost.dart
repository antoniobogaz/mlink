import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mlink_app/widgets/bottom_nav_bar.dart';
//import 'package:mlink_app/views/likedProfile.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class newPostPage extends StatefulWidget {
  const newPostPage({super.key});

  @override
  State<newPostPage> createState() => _newPostPageState();
}

class _newPostPageState extends State<newPostPage> {
  int _currentIndex = 2;
  final FirebaseStorage storage = FirebaseStorage.instance;
  bool uploading = false;
  double total = 0;
  List<Reference> refs = [];
  List<String> arquivos = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadImages();
  }

  loadImages() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      refs = (await storage.ref('posts/${user.uid}/').listAll()).items;
      for (var ref in refs) {
        arquivos.add(await ref.getDownloadURL());
      }
      setState(() {
        loading = false;
      });
    } else {
      print('Usuario não autenticado');
    }
  }

  Future<XFile?> getImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  Future<UploadTask> upload(String path) async {
    File file = File(path);
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        String ref = 'posts/${user.uid}/${DateTime.now().millisecondsSinceEpoch}.jpg';
        return storage.ref(ref).putFile(file);
      } on FirebaseException catch (e) {
        throw Exception('Erro no upload: ${e.code}');
      }
    } else {
      print('Usuário não autenticado.');
    }
    throw Exception('Erro no upload: Usuário não autenticado.');
  }

  pickandUploadImage() async {
    XFile? file = await getImage();
    if (file != null) {
      UploadTask task = await upload(file.path);

      task.snapshotEvents.listen((TaskSnapshot snapshot) async {
        if (snapshot.state == TaskState.running) {
          setState(() {
            uploading = true;
            total = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          });
        } else if (snapshot.state == TaskState.success) {
          arquivos.add(await snapshot.ref.getDownloadURL());
          refs.add(snapshot.ref);
          setState(() => uploading = false);
        }
      });
    }
  }

  deleteImage(int index) async {
    await storage.ref(refs[index].fullPath).delete();
    arquivos.removeAt(index);
    refs.removeAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 139, 92, 235),
          title: uploading
              ? Text('${total.round()}% enviado')
              : const Text(
                  'Coleção de Imagens',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
          actions: [
            uploading
                ? Padding(
                    padding: EdgeInsets.only(right: 12.0),
                    child: Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : IconButton(
                    icon: const Icon(Icons.upload),
                    onPressed: pickandUploadImage,
                  )
          ],
        ),
        body: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(24),
                child: arquivos.isEmpty
                    ? const Center(
                        child: Text(
                          'Não há Imagens',
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Container(
                              width: 60,
                              height: 40,
                              child: Image.network(arquivos[index], fit: BoxFit.cover),
                            ),
                            title: Text(refs[index].name),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.delete,
                                size: 30,
                                color: Color.fromARGB(255, 139, 92, 235),
                              ),
                              onPressed: () => deleteImage(index),
                            ),
                          );
                        },
                        itemCount: arquivos.length,
                      ),
              ),
        bottomNavigationBar: BottomNavBar(currentIndex: _currentIndex));
  }
}
