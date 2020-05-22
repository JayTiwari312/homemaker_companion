import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'crud.dart';

FirebaseUser loggedInUser;
final _auth = FirebaseAuth.instance;

class NewRecipeScreen extends StatefulWidget {
  @override
  static const String id = 'newRecipe_screen';
  _NewRecipeScreenState createState() => _NewRecipeScreenState();
}

class _NewRecipeScreenState extends State<NewRecipeScreen> {
  bool _progress = true;
  File _image;
  String authorName;
  String title;
  String description;

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  Widget getSpinner() {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }

  Future uploadRecipe() async {
    try {
      var imageFileName = DateTime.now().millisecondsSinceEpoch.toString();
      StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child(imageFileName);
      final StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      final StorageTaskSnapshot storageSnapshot = await uploadTask.onComplete;
      var downloadUrl = await storageSnapshot.ref.getDownloadURL();
      if (uploadTask.isComplete) {
        print("Image uploaded, URL = " + downloadUrl);
        Map<String, String> recipe = {
          "imageURL": downloadUrl,
          "email": loggedInUser.email,
          "authorName": authorName,
          "title": title,
          "descriptions": description,
        };
        crudMethods().addData(recipe).then((result) {
          Navigator.pop(context);
        });
      } else {
        print("something went wrong");
      }
    } catch (e) {
      print(e);
    }
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
    print("Photo uploaded");
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Center(
          child: Text(
            'Upload Your Recipe',
            style: TextStyle(
                fontSize: 23,
                color: Colors.pink.shade800,
                fontWeight: FontWeight.w900,
                fontFamily: 'Pacifico'),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.cloud_upload),
            onPressed: () {
              uploadRecipe();
              setState(() {
                _progress = false;
              });
            },
          ),
        ],
      ),
      body: _progress
          ? SafeArea(
              child: ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          getImage();
                        },
                        child: _image != null
                            ? Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.file(
                                    _image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 30),
                                height: 150,
                                width: 500,
                              )
                            : Container(
                                margin: EdgeInsets.symmetric(horizontal: 30),
                                child: Icon(
                                  Icons.add_a_photo,
                                ),
                                height: 150,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey.shade100,
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                      ),
                      Card(
                        margin: EdgeInsets.only(left: 30, right: 30, top: 30),
                        elevation: 11,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        child: TextField(
                          //controller: _textEmail,
                          onChanged: (value) {
                            authorName = value;
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.black26,
                              ),
                              hintText: "Author Name",
//                              errorText: _validateEmail
//                                  ? 'Please enter your password'
//                                  : null,
                              hintStyle: TextStyle(color: Colors.black26),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40.0)),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 16.0)),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.only(left: 30, right: 30, top: 30),
                        elevation: 11,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        child: TextField(
                          //controller: _textEmail,
                          onChanged: (value) {
                            title = value;
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.title,
                                color: Colors.black26,
                              ),
                              hintText: "Title",
//                              errorText: _validateEmail
//                                  ? 'Please enter your password'
//                                  : null,
                              hintStyle: TextStyle(color: Colors.black26),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40.0)),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 16.0)),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.only(left: 30, right: 30, top: 30),
                        elevation: 11,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        child: TextField(
                          maxLines: null,
                          minLines: 15,
                          keyboardType: TextInputType.multiline,
                          //controller: _textEmail,
                          onChanged: (value) {
                            description = value;
                          },
                          decoration: InputDecoration(
                              hintText: "Description",
//                              errorText: _validateEmail
//                                  ? 'Please enter your password'
//                                  : null,
                              hintStyle: TextStyle(color: Colors.black26),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40.0)),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 16.0)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          : getSpinner(),
    );
  }
}
