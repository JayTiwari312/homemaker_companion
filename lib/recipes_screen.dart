import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homemakercompanion/recipe_single.dart';
import 'crud.dart';
import 'navbar.dart';
import 'network_image.dart';
import 'new_recipe_screen.dart';

FirebaseUser loggedInUser;
final _auth = FirebaseAuth.instance;

class RecipesScreen extends StatefulWidget {
  static const String id = 'recipes_screen';
  @override
  _RecipesScreenState createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  final _firestore = Firestore.instance;
  Stream recipesStream;
  final messageTextController = TextEditingController();
  String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  final Color primaryColor = Colors.orangeAccent;
  final Color bgColor = Color(0xffF9E0E3);
  final Color secondaryColor = Color(0xff324558);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Theme(
        data: ThemeData(
          primaryColor: primaryColor,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            textTheme: TextTheme(
              title: TextStyle(
                color: secondaryColor,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            iconTheme: IconThemeData(color: secondaryColor),
            actionsIconTheme: IconThemeData(
              color: secondaryColor,
            ),
          ),
        ),
        child: Scaffold(
          backgroundColor: Theme.of(context).buttonColor,
          appBar: AppBar(
            backgroundColor: Colors.deepPurpleAccent,
            centerTitle: true,
            title: Text(
              'Recipes',
              style: TextStyle(
                  fontFamily: 'Niconne', color: Colors.white, fontSize: 35.0),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, Navbar.id);
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
            bottom: TabBar(
              isScrollable: false,
              labelColor: primaryColor,
              indicatorColor: primaryColor,
              unselectedLabelColor: secondaryColor,
              tabs: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("All Recipes"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Favourites"),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              //////////////////////////////////////////
              StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('recipes').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                    );
                  }
                  final recipes = snapshot.data.documents;
                  List<Widget> recipeWidgets = [];
                  for (var recipe in recipes) {
                    final recipeAuthor = recipe.data['authorName'];
                    final recipeEmail = recipe.data['email'];
                    final recipeDesc = recipe.data['descriptions'];
                    final recipeImage = recipe.data['imageURL'];
                    final recipeTitle = recipe.data['title'];
                    final recipeWidget = GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecipeSinglePage(
                              recipeAuthor: recipeAuthor,
                              recipeEmail: recipeEmail,
                              recipeDesc: recipeDesc,
                              recipeImage: recipeImage,
                              recipeTitle: recipeTitle,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        color: Colors.redAccent.shade100,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: 90,
                              height: 90,
                              color: Colors.orange.shade900,
                            ),
                            Container(
                              color: Colors.white,
                              padding: const EdgeInsets.all(16.0),
                              margin: const EdgeInsets.all(16.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 100,
                                    color: Colors.blue,
                                    width: 80.0,
                                    child: PNetworkImage(
                                      recipeImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 20.0),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          recipeTitle,
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            color: secondaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              WidgetSpan(
                                                child: CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                      'assets/nicasiaassets/profile.jpg'),
                                                  radius: 15.0,
                                                  backgroundColor: primaryColor,
                                                ),
                                              ),
                                              WidgetSpan(
                                                child:
                                                    const SizedBox(width: 5.0),
                                              ),
                                              TextSpan(
                                                  text: recipeAuthor,
                                                  style: TextStyle(
                                                      fontSize: 16.0)),
                                              WidgetSpan(
                                                child:
                                                    const SizedBox(width: 20.0),
                                              ),
                                              WidgetSpan(
                                                child:
                                                    const SizedBox(width: 5.0),
                                              ),
                                            ],
                                          ),
                                          style: TextStyle(height: 2.0),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                    recipeWidgets.add(recipeWidget);
                  }
                  return ListView.separated(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      return recipeWidgets[index];
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16.0),
                  );
                },
              ),
              Container(
                child: Text("Tab 2"),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.purpleAccent,
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, NewRecipeScreen.id);
            },
          ),
        ),
      ),
    );
  }
}
