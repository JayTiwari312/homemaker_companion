import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class crudMethods {
  String e;
  Future<void> addData(recipe) async {
    await Firestore.instance
        .collection('recipes')
        .add(recipe)
        .catchError((onError) {
      e = onError;
    });
    print(e);
  }

  getData() async {
    return await Firestore.instance.collection('recipes').snapshots();
  }
}
