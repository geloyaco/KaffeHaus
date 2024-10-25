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
        category, // The category name displayed as the title
        style: const TextStyle(
          fontSize: 22.0, // Increase font size for visibility
          fontWeight: FontWeight.bold, // Make the title bold
          color: Colors.white, // Set the title text color
        ),
      ),
      backgroundColor: Colors.brown.shade700, // Dark brown background to match coffee theme
      centerTitle: true, // Center the title
      elevation: 4.0, // Adds a subtle shadow for depth (set to 0.0 for flat app bar)
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white), // Custom back icon color
        onPressed: () {
          Navigator.pop(context); // Return to previous screen when pressed
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart, color: Colors.white), // Cart icon for potential future use
          onPressed: () {
            // Logic to navigate to shopping cart or orders page
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
                  fontSize: 22.0, // Larger font size for subcategory titles
                ),
              ),
              const SizedBox(height: 12.0), // More spacing between subcategory title and drinks
              Wrap(
                spacing: 16.0,
                runSpacing: 16.0,
                children: drinks.map((drink) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(24.0), // Increase padding for larger buttons
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0), // Rounded corners for buttons
                      ),
                      backgroundColor: Colors.brown.shade100, // Light brown for buttons
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
                          backgroundImage: AssetImage(drinkImages[drink] ?? 'assets/images/kaffehaus_logo.jpg'), // Drink-specific image
                          radius: 48.0, // Larger size for drink image
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          drink,
                          style: const TextStyle(
                            fontSize: 18.0, // Larger text for drinks
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