//drink_list_screen.dart
import 'package:flutter/material.dart';
import 'drink_customization_screen.dart';

class DrinkListScreen extends StatelessWidget {
  final String category;
  final Map<String, List<String>> subcategories;

  // Map each drink name to the corresponding image
  final Map<String, String> drinkImages = {
    'Caffe Americano': 'assets/images/caffe_americano.jpg',
    'Caffe Latte': 'assets/images/caffe_latte.jpg',
    'Pumpkin Spice Latte': 'assets/images/pumpkin_spice_latte.jpg',
    'Vanilla Latte': 'assets/images/vanilla_latte.jpg',
    'Cappuccino': 'assets/images/cappuccino.jpg',
    'Caffe Mocha': 'assets/images/caffe_mocha.jpg',
    'White Chocolate Mocha': 'assets/images/white_chocolate_mocha.jpg',
    'Caramel Macchiato': 'assets/images/caramel_macchiato.jpg',
    'Iced Coffee': 'assets/images/iced_coffee.jpg',
    'Iced Oatmilk Latte': 'assets/images/iced_oatmilk_latte.jpg',
    'Iced Caffe Latte': 'assets/images/iced_caffe_latte.jpg',
    'Cold Brew Coffee': 'assets/images/cold_brew_coffee.jpg',
    'Hot Chocolate': 'assets/images/hot_chocolate.jpg',
    'White Hot Chocolate': 'assets/images/white_hot_chocolate.jpg',
    'Chai Latte': 'assets/images/chai_latte.jpg',
    'Matcha Latte': 'assets/images/matcha_latte.jpg',
  };

DrinkListScreen({super.key, required this.category, required this.subcategories});

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        category, 
        style: const TextStyle(
          fontSize: 22.0, 
          fontWeight: FontWeight.bold, 
          color: Colors.white, 
        ),
      ),
      backgroundColor: Colors.brown.shade700, 
      centerTitle: true, 
      elevation: 4.0, 
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white), 
        onPressed: () {
          Navigator.pop(context); 
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart, color: Colors.white), 
          onPressed: () {
          },
        ),
      ],
    ),
    body: ListView(
      padding: const EdgeInsets.all(16.0),
      children: subcategories.entries.map((entry) {
        String subcategory = entry.key;
        List<String> drinks = entry.value;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subcategory,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0, 
                ),
              ),
              const SizedBox(height: 12.0), 
              Wrap(
                spacing: 16.0,
                runSpacing: 16.0,
                children: drinks.map((drink) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(24.0), 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0), 
                      ),
                      backgroundColor: Colors.brown.shade100, 
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DrinkCustomizationScreen(drinkName: drink),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(drinkImages[drink] ?? 'assets/images/kaffehaus_logo.jpg'), 
                          radius: 48.0, 
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          drink,
                          style: const TextStyle(
                            fontSize: 18.0, 
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      }).toList(),
    ),
  );
}
}