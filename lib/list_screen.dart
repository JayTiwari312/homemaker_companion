import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:homemakercompanion/items.dart';
import 'constants.dart';

class ListScreen extends StatefulWidget {
  static const String id = 'list_screen';
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<item> items = [
    item(item_name: "chocolate", quantity: 2, image: 'images/chocolate.jpeg'),
    item(item_name: "Milk", quantity: 2, image: 'images/milk.jpeg'),
    item(item_name: "Rice", quantity: 2, image: 'images/rice.jpeg'),
    item(item_name: "Rice", quantity: 2, image: 'images/rice.jpeg'),
    item(item_name: "Rice", quantity: 2, image: 'images/rice.jpeg'),
    item(item_name: "Rice", quantity: 2, image: 'images/rice.jpeg'),
    item(item_name: "Rice", quantity: 2, image: 'images/rice.jpeg'),
    item(item_name: "Rice", quantity: 2, image: 'images/rice.jpeg'),
    item(item_name: "Rice", quantity: 2, image: 'images/rice.jpeg'),
    item(item_name: "Rice", quantity: 2, image: 'images/rice.jpeg'),

  ];
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
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index){
          return Card(
            child: new Container(
              child: new Row(
                children: <Widget>[
                  new CircleAvatar(backgroundImage: AssetImage(items[index].image),),
                  new Text(items[index].item_name),
                  new RaisedButton(
                    onPressed: (){
                      setState(() {
                        if(items[index].quantity>0){
                          items[index].quantity--;
                        }
                      });
                    },
                    child: Text('-'),
                  ),
                  new Text((items[index].quantity.toString())),
                  new RaisedButton(
                    onPressed: (){
                      setState(() {
                        items[index].quantity++;
                      });
                    },
                    child: Text('+'),
                  ),
                ],
              ),
            ),

          );
        }
      )

        );
  }
}


