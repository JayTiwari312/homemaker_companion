import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:homemakercompanion/rounded_bordered_container.dart';
import 'assets.dart';

class AuthTwoPage extends StatelessWidget {
  final String backImg = meal;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/meal.jpg'),
                fit: BoxFit.cover
            )
        ),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                width: 600,
                margin: const EdgeInsets.all(20.0),
                //padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0,),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 10.0),
                      Text("About Us", style: TextStyle(
                          color: Colors.deepOrange.shade700,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold
                      ),),
                      const SizedBox(height: 20.0),
                      RoundedContainer(
                        padding: const EdgeInsets.all(0),
                        margin: EdgeInsets.all(10),
                        height: 120,
                        //width: 500,
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 100,
                              height: 100,
                              margin: EdgeInsets.all(10.0),
                              child: Expanded(
                                  child: Container(
                                decoration: BoxDecoration(

                                    image: DecorationImage(image: AssetImage('images/Jay.jpg'), fit: BoxFit.cover),
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    boxShadow: [
                                      BoxShadow(color: Colors.grey,offset: Offset(2.0,2.0), blurRadius: 1.0)
                                    ]
                                ),
                              )
                              ),
                            ),
                            Container(
                              child: Expanded(child: Container(
                                padding: EdgeInsets.all(20.0),
                                child: Column(
                                  children: <Widget>[
                                    Text('Jay',style: TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.w700
                                    ),),
                                    //SizedBox(height: 10.0,),

                                    SizedBox(height: 2.0,),
                                    Text("Jay@gmail.com", style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    )),
//                                    SizedBox(height: 2.0,),
//                                    Text('Number', style: TextStyle(
//                                        fontSize: 18.0,
//                                        color: Colors.black,
//                                        height: 1.5
//                                    ))
                                  ],
                                ),
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(color: Colors.grey,offset: Offset(2.0,2.0), blurRadius: 1.0)
                                    ]
                                ),
                              ),),
                            )
                          ],
                        ),
                      ),
                      //const SizedBox(height: 30.0),
                      RoundedContainer(
                        padding: const EdgeInsets.all(0),
                        margin: EdgeInsets.all(10),
                        height: 120,
                        //width: 500,
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 100,
                              height: 100,
                              margin: EdgeInsets.all(10.0),
                              child: Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(

                                        image: DecorationImage(image: AssetImage('images/Vatsal.jpg'), fit: BoxFit.cover),
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                        boxShadow: [
                                          BoxShadow(color: Colors.grey,offset: Offset(2.0,2.0), blurRadius: 1.0)
                                        ]
                                    ),
                                  )
                              ),
                            ),
                            Container(
                              child: Expanded(child: Container(
                                padding: EdgeInsets.all(20.0),
                                child: Column(
                                  children: <Widget>[
                                    Text('Vatsal',style: TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.w700
                                    ),),
                                    //SizedBox(height: 10.0,),

                                    SizedBox(height: 2.0,),
                                    Text("Vatsal@gmail.com", style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    )),
//                                    SizedBox(height: 2.0,),
//                                    Text('Number', style: TextStyle(
//                                        fontSize: 18.0,
//                                        color: Colors.black,
//                                        height: 1.5
//                                    ))
                                  ],
                                ),
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(color: Colors.grey,offset: Offset(2.0,2.0), blurRadius: 1.0)
                                    ]
                                ),
                              ),),
                            )
                          ],
                        ),
                      ),

                      const SizedBox(height: 30.0),

                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}