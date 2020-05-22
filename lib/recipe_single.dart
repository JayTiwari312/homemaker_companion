import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homemakercompanion/network_image.dart';
import 'package:marquee/marquee.dart';
import 'dart:math';

class RecipeSinglePage extends StatefulWidget {
  RecipeSinglePage({
    @required this.recipeAuthor,
    @required this.recipeEmail,
    @required this.recipeDesc,
    @required this.recipeImage,
    @required this.recipeTitle,
  });
  final recipeAuthor;
  final recipeEmail;
  final recipeDesc;
  final recipeImage;
  final recipeTitle;
  @override
  _RecipeSinglePageState createState() => _RecipeSinglePageState();
}

class _RecipeSinglePageState extends State<RecipeSinglePage> {
  static const int min = 20;
  static const int max = 90;
  final String r = (min + Random().nextInt(max - min)).toString();

  Color like = Colors.black;
  final Color icon = Colors.orange.shade700;
  final Color color1 = Colors.purple.shade600;
  final Color color2 = Colors.deepPurple.shade900;
  final Color color3 = Colors.purpleAccent;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: 350,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [color2, color3],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  )),
              Positioned(
                  child: Container(
                height: 650,
                width: 300,
                decoration: BoxDecoration(
                    color: color1,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(80.0))),
              )),
              Positioned(
                top: 350,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 40.0),
                      Text(
                        widget.recipeTitle,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 30.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        widget.recipeAuthor,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        width: 270,
                        height: 100,
                        //height: 400,
                        child: SingleChildScrollView(
                          child: Text(
                            widget.recipeDesc,
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                      ),
                      SizedBox(height: 50.0),
                      SizedBox(
                        height: 30.0,
                        width: double.infinity,
                        child: Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.fire, color: Colors.white),
                            SizedBox(width: 5.0),
                            Text(
                              "$r%",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            ),
                            Spacer(),
                            VerticalDivider(color: Colors.white),
                            Spacer(),
                            Text(
                              "Vegetarian",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            ),
                            Spacer(),
                            VerticalDivider(color: Colors.white),
                            Spacer(),
                            Icon(FontAwesomeIcons.stopwatch,
                                color: Colors.white),
                            SizedBox(width: 5.0),
                            Text(
                              "10m read",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 380,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(color: Colors.black38, blurRadius: 30.0)
                ]),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 350,
                  child: PNetworkImage(
                    widget.recipeImage,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: 325,
                left: 20,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 25,
                  child: IconButton(
                      color: icon,
                      onPressed: () {},
                      icon: Icon(
                        Icons.play_arrow,
                      )),
                ),
              ),
              Positioned(
                top: 325,
                right: 20,
                //width: 50,
                child: RaisedButton(
                  child: Center(
                    child: Icon(
                      Icons.favorite,
                      color: like,
                      size: 30,
                    ),
                  ),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0)),
                  onPressed: () {
                    setState(() {
                      if (like == (Colors.red)) {
                        like = Colors.black;
                      } else {
                        like = Colors.red;
                      }
                    });
                  },
                ),
              ),
              Container(
                  height: 70.0,
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
