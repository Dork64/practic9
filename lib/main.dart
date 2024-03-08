import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Мое приложение',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[800],
        ),
      ),
      home: const MyHomePage(title: 'Мое приложение'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Мое приложение'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WidgetScreen('Виджет 1')),
                );
              },
              child: Text('Виджет 1'),
            ),
            const SizedBox(height: 40,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WidgetScreen('Виджет 2')),
                );
              },
              child: Text('Виджет 2'),
            ),
            const SizedBox(height: 40,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WidgetScreen('Виджет 3')),
                );
              },
              child: Text('Виджет 3'),
            ),
            const SizedBox(height: 40,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WidgetScreen('Виджет 4')),
                );
              },
              child: Text('Виджет 4'),
            ),
            const SizedBox(height: 40,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WidgetScreen('Виджет 5')),
                );
              },
              child: Text('Виджет 5'),
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetScreen extends StatelessWidget {
  final String widgetName;

  WidgetScreen(this.widgetName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widgetName),
      ),
      body: Center(
        child: Text('Вы попали на $widgetName'),
      ),
    );
  }
}
