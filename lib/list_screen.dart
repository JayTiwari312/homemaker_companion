import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:homemakercompanion/items.dart';
import 'package:homemakercompanion/side_drawer.dart';
import 'constants.dart';
import 'rounded_bordered_container.dart';
class ListScreen extends StatefulWidget {
  static const String id = 'list_screen';
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<item> items = [
    item(item_name: "Chocolate", quantity: 2, image: 'images/chocolate.png', type: 'Units'),
    item(item_name: "Milk", quantity: 2, image: 'images/milk.png', type: 'Litre'),
    item(item_name: "Soap", quantity: 2, image: 'images/soap.png', type: 'Units'),
    item(item_name: "Rice", quantity: 2, image: 'images/rice.png', type: 'Kg'),
    item(item_name: "Toothpaste", quantity: 2, image: 'images/toothpaste.png', type: 'Units'),
    item(item_name: "Cookies", quantity: 2, image: 'images/cookies.png', type: 'Gram'),
    item(item_name: "Tea", quantity: 2, image: 'images/tea.png', type: 'Kg'),
    item(item_name: "Oil", quantity: 2, image: 'images/oil.png', type: 'Litre'),
    item(item_name: "Notebooks", quantity: 2, image: 'images/notebook.png', type: 'Units'),
    item(item_name: "Pen", quantity: 2, image: 'images/pen.png', type: 'Units'),
    item(item_name: "Pencil", quantity: 2, image: 'images/pencil.png', type: 'Units'),
  ];

  List<DropdownMenuItem<String>> _dropDownItem() {
    List<String> ddl = ["None", 'Gram', 'Kg', 'Litre', 'ml', 'Units'];
    return ddl
        .map((value) => DropdownMenuItem(
      value: value,
      child: Text(value),
    )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      appBar: AppBar(

        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){
            Scaffold.of(context).openDrawer();
          },
        ),
//        actions: <Widget>[
//          IconButton(icon: Icon(Icons.close), onPressed: () {}),
//        ],

        title: Center(child: Text('Item List')),
        backgroundColor: Colors.blue[800],
      ),
      drawer: new SideDrawer(),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, int index) {
                return SingleChildScrollView(
                    child: RoundedContainer(
                      color: Colors.white30,
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
                                          InkWell(    //Reduce Item
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
                                          Card(   //Item Quantity
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(items[index].quantity.toString()),
                                            ),
                                          ),
                                          InkWell(    //Quantity Type
                                            onTap: () {},
                                            splashColor: Colors.lightBlue,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(100)),
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding: const EdgeInsets.all(6.0),
                                                child: Container(
                                                  child: DropdownButton(
                                                    value: items[index].type,
                                                    items: _dropDownItem(),
                                                    onChanged: (value){
                                                      setState(() {
                                                        items[index].type = value;
                                                      });
                                                    },
                                                  ),
                                                  height: 50,
                                                  width: 70,
                                                ),

                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          InkWell(    //Increase Item
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


