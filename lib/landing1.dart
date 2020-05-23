import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
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
                margin: const EdgeInsets.all(48.0),
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0,),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
//                      Icon(Icons.restaurant_menu, size: 64, color: Colors.grey.shade800,),
                      const SizedBox(height: 10.0),
                      Text("About Us", style: TextStyle(
                          color: Colors.deepOrange.shade700,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold
                      ),),
                      const SizedBox(height: 20.0),
                      InkWell(
                        onTap: (){},
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100))
                        ),
                      ),
                      const SizedBox(height: 30.0),

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