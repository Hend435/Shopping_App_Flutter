import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Addingmodel extends StatefulWidget {
  const Addingmodel({super.key});

  @override
  State<Addingmodel> createState() => _AddingmodelState();
}

class _AddingmodelState extends State<Addingmodel> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPrice = TextEditingController();
  bool isLoading = false;

  Future addModel(String name, String price) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    if (_image != null) {
      uploadImage().then((value) async {
        await firestore.collection('Formal').add({
          'name': controllerName.text,
          'price': controllerPrice.text,
          'img': imgUrl,
        });
      });
    }
  }

  File? _image;
  String? imgUrl;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      File? img = File(image.path);
      setState(() {
        _image = img;
      });
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future uploadImage() async {
    try {
      String imgpath = _image!.path;
      String imgName = imgpath.split('/').last;
      final filepath = '/formalImages/$imgName';
      final ref = FirebaseStorage.instance.ref().child(filepath);
      final UploadTask task = ref.putFile(_image!);
      imgUrl = await (await task).ref.getDownloadURL();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "MODEL DETAILS",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink),
              ),
              TextFormField(
                controller: controllerName,
                decoration: const InputDecoration(
                    labelText: 'Model Name', focusColor: Colors.pink),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controllerPrice,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Model Price', focusColor: Colors.pink),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                height: 50,
                color: Colors.pink,
                child: MaterialButton(
                  onPressed: () {
                    pickImage();
                  },
                  child: const Text(
                    "add photo",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              _image != null ? Image.file(_image!) : Container(),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                height: 50,
                color: Colors.pink,
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : MaterialButton(
                        onPressed: () {
                          if (controllerName.text.isNotEmpty &&
                              controllerPrice.text.isNotEmpty) {
                            setState(() {
                              isLoading = true;
                            });
                            addModel(controllerName.text, controllerPrice.text)
                                .then((value) {
                              Navigator.pop(context);
                            });
                          }
                        },
                        child: const Text(
                          "Add to models",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
