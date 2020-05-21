import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:homemakercompanion/items.dart';
import 'constants.dart';
import 'rounded_bordered_container.dart';
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
      
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, int index) {
                return SingleChildScrollView(
                    child: RoundedContainer(
                      padding: const EdgeInsets.all(0),
                      margin: EdgeInsets.all(10),
                      height: 100,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(items[index].image),
                                  fit: BoxFit.cover,
                                )
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Flexible(
                                        child: Text(
                                          items[index].item_name,
                                          overflow: TextOverflow.fade,
                                          softWrap: true,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600, fontSize: 25,fontFamily: 'IndieFlower'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Spacer(),
                                      Row(
                                        children: <Widget>[
                                          InkWell(
                                            onTap: () {},
                                            splashColor: Colors.redAccent.shade200,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(50)),
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding: const EdgeInsets.all(6.0),
                                                child: Container(
                                                  height: 40,
                                                  width: 40,
                                                  child: Center(
                                                    child: RaisedButton(
                                                      onPressed: (){
                                                        setState(() {
                                                          if(items[index].quantity>0){
                                                            items[index].quantity--;
                                                          }
                                                        });
                                                      },
                                                      color: Colors.white,
                                                      child: Text('-', style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.red)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Card(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(items[index].quantity.toString()),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            splashColor: Colors.lightBlue,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(50)),
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding: const EdgeInsets.all(6.0),
                                                child: Container(
                                                  height: 40,
                                                  width: 40,
                                                  child: Center(
                                                    child: RaisedButton(
                                                      onPressed: (){
                                                        setState(() {
                                                          items[index].quantity++;
                                                        });
                                                      },
                                                      color: Colors.white,
                                                      child: Text('+', style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.blue)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                );
              },
            ),
          ),
        ],
      )
    );
  }
}
