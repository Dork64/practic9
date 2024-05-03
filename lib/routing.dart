import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 7));
    return 'Данные загружены';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          String data = await fetchData();
          showDialog(
            context: context,
            builder: (BuildContext context) {

              return AlertDialog(
                title: Text('Загрузка данных'),
                content: Text(data),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Закрыть'),
                  ),
                ],
              );
            },
          );
        },
        child: Text('Загрузить данные'),
      ),
    );
  }
}

class ListScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: "https://i.postimg.cc/4Ngfj4rq/1628777678-2-p-kotenok-1-mesyats-foto-2.jpg",
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}

class ListScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: "https://i.postimg.cc/d1CFSgnJ/e4f6e5u-960.jpg",
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}

class ListScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: "https://i.postimg.cc/ZqBzCXG6/1628690500-51-p-kotenok-1-mesyats-foto-kak-viglyadit-54.jpg",
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}

class ListScreen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: "https://i.postimg.cc/QCjzkzy4/1-kotik-1024x682.jpg",
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}

class ListScreen5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: "https://i.postimg.cc/jdg1PZQc/ff35937abc69ac41a71fb51eab7ba219.jpg",
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}