import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'constants.dart';

class ListScreen extends StatefulWidget {
  static const String id = 'list_screen';
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.close), onPressed: () {}),
        ],
        title: Center(child: Text('List')),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: Text(
          'List Screen',
          style: TextStyle(fontSize: 50.0),
        ),
      ),
    );
  }
}
