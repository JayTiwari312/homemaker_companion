import 'package:flutter/material.dart';
import 'home_screen.dart';

class IngredientsList extends StatefulWidget {
  @override
  _IngredientsListState createState() => _IngredientsListState();
}

class _IngredientsListState extends State<IngredientsList> {
  int _currentIndex = 0;

  final List<Widget> _children = [IngredientsList(), HomeScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('List'),
            backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.fastfood),
              title: Text('Recipes'),
              backgroundColor: Colors.blue
          )
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
  void _onItemTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }
}
