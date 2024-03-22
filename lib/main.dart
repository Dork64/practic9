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
                  MaterialPageRoute(builder: (context) => WidgetColumn('Widget Column')),
                );
              },
              child: Text('Widget Column'),
            ),
            const SizedBox(height: 40,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListViewColumn('Widget List-view')),
                );
              },
              child: Text('Widget List-view'),
            ),
            const SizedBox(height: 40,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListViewSeparatedColumn('Widget List-view.separated')),
                );
              },
              child: Text('Widget List-view.separated'),
            ),
          ],
        ),
      ),
    );
  }
}


class WidgetColumn extends StatefulWidget {
  final String widgetName;

  WidgetColumn(this.widgetName);

  @override
  _WidgetColumnState createState() => _WidgetColumnState();
}

class _WidgetColumnState extends State<WidgetColumn> {
  final items = ['Bitcoin', 'Litecoin', 'Ethereum', 'Dogecoin', 'Tether', 'Solana', 'Monero'];
  TextEditingController textFieldController = TextEditingController();

  void addItem(String newItem) {
    setState(() {
      items.add(newItem);
    });
  }

  void deleteItem(String item) {
    setState(() {
      items.remove(item);
    });
  }

  void showErrorSnackBar(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('Ошибка: Достигнуто максимальное количество элементов'),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.widgetName),
      ),
      body: Column(
        children: [
          TextField(
            controller: textFieldController,
            decoration: const InputDecoration(labelText: 'Введите элемент'),
          ),
          ElevatedButton(
            child: const Text('Добавить элемент'),
            onPressed: () {
              if (items.length < 10) {
                addItem(textFieldController.text);
                textFieldController.clear();
              } else {
                showErrorSnackBar(context);
              }
            },
          ),
          Column(
            children: items.map((item) {
              return ListTile(
                title: Text(item),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    deleteItem(item);
                  },
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class ListViewColumn extends StatefulWidget {
  final String widgetName;

  ListViewColumn(this.widgetName);

  @override
  _ListViewColumnState createState() => _ListViewColumnState();
}

class _ListViewColumnState extends State<ListViewColumn> {
  final items = ['Bitcoin', 'Litecoin', 'Ethereum', 'Dogecoin', 'Tether', 'Solana', 'Monero'];

  TextEditingController textFieldController = TextEditingController();

  void addItem(String newItem) {
    setState(() {
      items.add(newItem);
    });
  }

  void deleteItem(String item) {
    setState(() {
      items.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.widgetName),
      ),
      body: Column(
        children: [
          TextField(
            controller: textFieldController,
            decoration: InputDecoration(labelText: 'Введите элемент'),
          ),
          ElevatedButton(
            child: Text('Добавить элемент'),
            onPressed: () {
              addItem(textFieldController.text);
              textFieldController.clear();
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      deleteItem(items[index]);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ListViewSeparatedColumn extends StatefulWidget {
  final String widgetName;

  ListViewSeparatedColumn(this.widgetName);

  @override
  _ListViewSeparatedColumnState createState() => _ListViewSeparatedColumnState();
}

class _ListViewSeparatedColumnState extends State<ListViewSeparatedColumn> {
  final items = ['Bitcoin', 'Litecoin', 'Ethereum', 'Dogecoin', 'Tether', 'Solana', 'Monero'];

  TextEditingController textFieldController = TextEditingController();

  void addItem(String newItem) {
    setState(() {
      items.add(newItem);
    });
  }

  void deleteItem(String item) {
    setState(() {
      items.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.widgetName),
      ),
      body: Column(
        children: [
          TextField(
            controller: textFieldController,
            decoration: InputDecoration(labelText: 'Введите элемент'),
          ),
          ElevatedButton(
            child: Text('Добавить элемент'),
            onPressed: () {
              addItem(textFieldController.text);
              textFieldController.clear();
            },
          ),
          Expanded(
            child: ListView.separated(
              itemCount: items.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      deleteItem(items[index]);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

