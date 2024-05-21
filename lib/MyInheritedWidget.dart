import 'package:flutter/material.dart';

class MyInheritedWidget extends InheritedWidget {

  const MyInheritedWidget({Key? key,
    required this.child,
  }) : super(key: key, child: child);

  @override
  final Widget child;

  // Переменные, которые будут передаваться
  final String message1 = 'First Screen';
  final String message2 = 'Second Screen';
  final String message3 = 'Third Screen';
  final String message4 = 'Forth Screen';
  final String message5 = 'Fifth Screen';

// Поиск объекта класса InheritedWidget
  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!;
  }

  // Автоматическое оповещение о изменении состояния виджета
  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return true;
  }
}