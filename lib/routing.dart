import 'package:flutter/material.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Другая реализация')),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomeContent(),
          ListScreen1(),
          ListScreen2(),
          ListScreen3(),
          ListScreen4(),
          ListScreen5(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.grey[900], // Цвет фона нижней панели
        selectedItemColor: Colors.white, // Цвет для выбранного элемента
        unselectedItemColor: Colors.grey, // Цвет для не выбранных элементов
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List 3',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List 4',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List 5',
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Screen'),
    );
  }
}

class ListScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('List Screen 1'));
  }
}

class ListScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('List Screen 2'));
  }
}

class ListScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('List Screen 3'));
  }
}

class ListScreen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('List Screen 4'));
  }
}

class ListScreen5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('List Screen 5'));
  }
}