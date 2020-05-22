import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'constants.dart';
import 'side_drawer.dart';
import 'assets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){
            Scaffold.of(context).openDrawer();
          },
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.close), onPressed: () {}),
        ],
        title: Center(child: Text('Dashboard')),
        backgroundColor: Colors.blue[800],
      ),
      drawer: new SideDrawer(),
      body: Stack(
        children: [
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              height: 380,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
          ),
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              height: 380,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(pancake),
                    fit: BoxFit.cover),
              ),
              foregroundDecoration:
              BoxDecoration(color: Colors.blue.withOpacity(0.6)),
            ),
          ),
          ListView(
            padding: const EdgeInsets.all(8.0),
            children: [
              const SizedBox(height: 90),
              CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 80,
                  child: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    radius: 78,
                    backgroundImage: AssetImage('images/user1.png'),
                  ),
              ),
              const SizedBox(height: 10.0),
              Text(
                "User name",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5.0),
              Text(
                "About User",
                style: TextStyle(
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10.0),
              Card(
                color: Colors.white,
                elevation: 0,
                margin: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 32.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "150",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              "Followers",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "105",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              "Following",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                "Recently Added Items",
                style: Theme.of(context).textTheme.headline5, textScaleFactor: 1.2,
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildFavoriteCard(context, "Chocolate", 'images/chocolate.png'),
                    const SizedBox(width: 10.0),
                    _buildFavoriteCard(context, "Rice",'images/rice.png' ),
                    const SizedBox(width: 10.0),
                    _buildFavoriteCard(context, "Notebook", 'images/notebook.png'),
                    const SizedBox(width: 10.0),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                "My Contacts",
                style: Theme.of(context).textTheme.headline5,
              ),
              Container(
                height: 60,
                width: double.infinity,
                child: Stack(
                  children: [
                    ...images
                        .asMap()
                        .map(
                          (i, e) => MapEntry(
                        i,
                        Transform.translate(
                          offset: Offset(i * 30.0, 0),
                          child: SizedBox(height: 60,width: 60,child: _buildAvatar(e, radius: 30)),
                        ),
                      ),
                    )
                        .values
                        .toList(),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
  CircleAvatar _buildAvatar(String image, {double radius = 80}) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: radius,
      child: CircleAvatar(
        radius: radius - 2,
        backgroundImage: CachedNetworkImageProvider(image),
      ),
    );
  }

  Widget _buildFavoriteCard(BuildContext context, String title, String image) {
    return Container(
      width: 150,
      height: 150,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey[900],
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey[700],
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 4.0,
            ),
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
                image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10.0)),
            foregroundDecoration: BoxDecoration(
                color: Colors.blueGrey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10.0)),
          ),
          Container(
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 20),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.white), textScaleFactor: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}

