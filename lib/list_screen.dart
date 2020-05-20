import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:homemakercompanion/items.dart';
import 'constants.dart';

class ListScreen extends StatefulWidget {
  static const String id = 'list_screen';
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<item> items = [
    item(item_name: "Chocolate", quantity: 2, image: 'images/chocolate.jpeg'),
    item(item_name: "Milk", quantity: 2, image: 'images/milk.jpeg'),
    item(item_name: "Soap", quantity: 2, image: 'images/soap.jpeg'),
    item(item_name: "Rice", quantity: 2, image: 'images/rice.jpeg'),
    item(item_name: "Toothpaste", quantity: 2, image: 'images/toothpaste.jpeg'),
    item(item_name: "Cookies", quantity: 2, image: 'images/cookies.jpeg'),
    item(item_name: "Tea", quantity: 2, image: 'images/tea.jpeg'),
    item(item_name: "Oil", quantity: 2, image: 'images/oil.jpeg'),
    item(item_name: "Notebooks", quantity: 2, image: 'images/notebooks.jpeg'),
    item(item_name: "Pen", quantity: 2, image: 'images/pen.jpeg'),
    item(item_name: "Pencil", quantity: 2, image: 'images/pen.jpeg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
//        actions: <Widget>[
//          IconButton(icon: Icon(Icons.close), onPressed: () {}),
//        ],

        title: Center(child: Text('Item List')),
        backgroundColor: Colors.lightBlueAccent,
      ),
      
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index){
          return SingleChildScrollView(
            child: Card(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0,top: 10.0, bottom: 10.0),
              child: new Container(
                child: new Row(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                            child: new CircleAvatar(backgroundImage: AssetImage(items[index].image),
                            ),
                            color: Colors.grey.shade400,
                        ),
                        flex: 1,
                    ),
                    Expanded(
                          child: Container(
                            child: Center(child: new Text(
                                items[index].item_name,
                                style: TextStyle(fontWeight: FontWeight.bold),)
                            ),
                            height: 30,
                            padding: EdgeInsets.symmetric(),
                            color: Colors.amber,
                          ),
                        flex: 1,),
                    Expanded(
                        child: Container(
                          child: new RaisedButton(
                          onPressed: (){
                            setState(() {
                              if(items[index].quantity>0){
                                items[index].quantity--;
                              }
                            });
                          },
                            
                          child: Text('-', style: TextStyle(fontWeight: FontWeight.bold),),
                            color: Colors.red,
                      ),
                          height: 20,
                          width: 10,
                        ),
                      flex: 1,
                    ),
                    Expanded(
                        child: Container(
                          child: Center(
                              child: new Text(items[index].quantity.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          color: Colors.amber,
                        ),
                        flex: 1,
                    ),
                    Expanded(
                      child: new RaisedButton(
                        onPressed: (){
                          setState(() {
                            items[index].quantity++;
                          });
                        },
                        child: Text('+'),
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ),

            ),
          );
        }
      ),
        backgroundColor: Colors.grey.shade400,

        );
  }
}


