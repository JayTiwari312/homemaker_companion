import 'package:flutter/material.dart';
import 'package:homemakercompanion/list_screen.dart';
import 'package:homemakercompanion/recipes_screen.dart';
import 'home_screen.dart';

class Navbar extends StatefulWidget {
  static const String id = 'navbar';
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex = 0;

  final List<Widget> _children = [HomeScreen(), RecipesScreen(), ListScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.fastfood),
              title: Text('Recipes'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('List'),
              backgroundColor: Colors.blue)
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
