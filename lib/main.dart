//main.dart
import 'package:coffee_shop/screens/menu_screen.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const CoffeeApp());
}

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KaffeHaus',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: const HomeScreen(),
      routes: {
        '/menu': (context) => const MenuScreen(),
      },
    );
  }
}
