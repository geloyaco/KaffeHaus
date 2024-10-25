//menu_screen.dart
import 'package:flutter/material.dart';
import 'drink_list_screen.dart';

// Drink menu data
final Map<String, Map<String, List<String>>> drinkMenu = {
  'Hot Coffees': {
    'Americanos': ['Caffe Americano'],
    'Lattes': ['Caffe Latte', 'Pumpkin Spice Latte', 'Vanilla Latte'],
    'Cappuccinos': ['Cappuccino'],
    'Mochas': ['Caffe Mocha', 'White Chocolate Mocha'],
    'Macchiatos': ['Caramel Macchiato'],
  },
  'Cold Coffees': {
    'Iced Coffees': ['Iced Coffee'],
    'Iced Lattes': ['Iced Oatmilk Latte', 'Iced Caffe Latte'],
    'Cold Brews': ['Cold Brew Coffee'],
  },
  'Milk': {
    'Hot Chocolates': ['Hot Chocolate', 'White Hot Chocolate'],
  },
  'Hot Teas': {
    'Chai Teas': ['Chai Latte'],
    'Green Teas': ['Matcha Latte'],
  },
};
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: Colors.brown[400],
      ),
      body: ListView.builder(
        itemCount: drinkMenu.length,
        itemBuilder: (context, index) {
          final category = drinkMenu.keys.elementAt(index);
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(35.0),
              title: Text(
                category,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward, color: Colors.brown),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DrinkListScreen(
                      category: category,
                      subcategories: drinkMenu[category]!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
