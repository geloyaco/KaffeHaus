//drink_customization_screen.dart
import 'package:flutter/material.dart';

class DrinkCustomizationScreen extends StatefulWidget {
  final String drinkName;

  const DrinkCustomizationScreen({super.key, required this.drinkName});

  @override
  _DrinkCustomizationScreenState createState() =>
      _DrinkCustomizationScreenState();
}

class CustomOptionWrapper extends StatelessWidget {
  final String label;
  final Widget child;

  const CustomOptionWrapper({
    super.key,
    required this.label,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 8.0), // Consistent vertical spacing
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0, // Bold and larger label text
              color: Colors.brown, // Add a themed color
            ),
          ),
          const SizedBox(height: 4), // Space between label and dropdown
          child, // The dropdown or any other widget passed
        ],
      ),
    );
  }
}

class _DrinkCustomizationScreenState extends State<DrinkCustomizationScreen> {
  // Customization options
  String selectedWater = 'Normal';
  String espressoType = 'Signature';
  int espressoShots = 1;
  String milkType = 'Almond';
  String milkTemperature = 'Steamed';
  String milkFoam = 'No Foam';
  int syrupPumps = 0;
  int chaiPumps = 0;
  int mochaPumps = 0;
  int matchaScoops = 0;
  String iceLevel = 'Normal';
  String whippedCream = 'Regular';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.drinkName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.brown.shade800,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          if (widget.drinkName.contains('Americano')) ...[
            buildSectionTitle('Americano Customization'),
            const SizedBox(height: 8),
            buildWaterCustomization(),
            const SizedBox(height: 12),
            buildEspressoTypeSelector(),
            const SizedBox(height: 12),
            buildEspressoShotsCounter(),
          ] else if (widget.drinkName.contains('Latte') ||
              widget.drinkName.contains('Cappuccino') ||
              widget.drinkName.contains('Mocha') ||
              widget.drinkName.contains('Macchiato') ||
              widget.drinkName.contains('Flat White')) ...[
            buildSectionTitle('Milk-Based Customization'),
            buildMilkTypeSelector(),
            const SizedBox(height: 8),
            buildMilkTemperatureSelector(),
            const SizedBox(height: 12),
            buildMilkFoamSelector(),
            const SizedBox(height: 12),
            buildSyrupPumpsCounter(),
          ] else if (widget.drinkName == 'Chai Latte') ...[
            buildSectionTitle('Chai Latte Customization'),
            buildMilkTypeSelector(),
            const SizedBox(height: 8),
            buildMilkTemperatureSelector(),
            const SizedBox(height: 12),
            buildMilkFoamSelector(),
            const SizedBox(height: 12),
            buildChaiPumpsCounter(),
            const SizedBox(height: 12),
            buildWaterCustomization(),
          ] else if (widget.drinkName.contains('Matcha')) ...[
            buildSectionTitle('Matcha Customization'),
            buildMilkTypeSelector(),
            const SizedBox(height: 8),
            buildMilkTemperatureSelector(),
            const SizedBox(height: 12),
            buildMilkFoamSelector(),
            const SizedBox(height: 12),
            buildMatchaScoopsCounter(),
          ] else if (widget.drinkName.contains('Iced')) ...[
            buildSectionTitle('Iced Drink Customization'),
            buildIceLevelSelector(),
            const SizedBox(height: 8),
            if (widget.drinkName.contains('Iced Latte')) ...[
              buildMilkTypeSelector(),
              const SizedBox(height: 8),
              buildMilkFoamSelector(),
              const SizedBox(height: 12),
              buildSyrupPumpsCounter(),
            ],
          ] else if (widget.drinkName.contains('Cold Brew')) ...[
            buildSectionTitle('Cold Brew Customization'),
            buildIceLevelSelector(),
            const SizedBox(height: 8),
          ] else if (widget.drinkName.contains('Hot Chocolate')) ...[
            buildSectionTitle('Hot Chocolate Customization'),
            buildMilkTypeSelector(),
            const SizedBox(height: 8),
            buildMilkFoamSelector(),
            const SizedBox(height: 12),
            buildMilkTemperatureSelector(),
            const SizedBox(height: 12),
            buildMochaPumpsCounter(),
            const SizedBox(height: 12),
            buildWhippedCreamSelector(),
          ],
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
              backgroundColor: Colors.brown.shade400, // Button color
            ),
            child: const Text(
              'Add to Order',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widgets
  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildSyrupPumpsCounter() {
    return buildCounter(
      label: 'Syrup Pumps',
      value: syrupPumps,
      onIncrement: () => setState(() => syrupPumps++),
      onDecrement: () {
        if (syrupPumps > 0) setState(() => syrupPumps--);
      },
    );
  }

  Widget buildMochaPumpsCounter() {
    return buildCounter(
      label: 'Mocha Sauce Pumps',
      value: mochaPumps, 
      onIncrement: () => setState(() => mochaPumps++),
      onDecrement: () {
        if (mochaPumps > 0) setState(() => mochaPumps--);
      },
    );
  }

  Widget buildChaiPumpsCounter() {
      return buildCounter(
        label: 'Chai Pumps',
        value: chaiPumps,
        onIncrement: () => setState(() => chaiPumps++),
        onDecrement: () {
          if (chaiPumps > 0) setState(() => chaiPumps--);
        },
      );
    }
    
  Widget buildMatchaScoopsCounter() {
    return buildCounter(
      label: 'Matcha Scoops',
      value: matchaScoops,
      onIncrement: () => setState(() => matchaScoops++),
      onDecrement: () {
        if (matchaScoops > 0) setState(() => matchaScoops--);
      },
    );
  }

  Widget buildWaterCustomization() {
    return buildDropdown(
      label: 'Water Amount',
      value: selectedWater,
      items: ['No Water', 'Light', 'Normal', 'Extra'],
      onChanged: (value) => setState(() => selectedWater = value!),
    );
  }

  Widget buildEspressoTypeSelector() {
    return buildDropdown(
      label: 'Espresso Type',
      value: espressoType,
      items: ['Signature', 'Blonde', 'Decaf'],
      onChanged: (value) => setState(() => espressoType = value!),
    );
  }

  Widget buildMilkTypeSelector() {
    return buildDropdown(
      label: 'Milk Type',
      value: milkType,
      items: ['Almond', 'Oatmilk', 'Heavy Cream'],
      onChanged: (value) => setState(() => milkType = value!),
    );
  }

  Widget buildMilkTemperatureSelector() {
    return buildDropdown(
      label: 'Milk Temperature',
      value: milkTemperature,
      items: ['Warm', 'Hot', 'Steamed'],
      onChanged: (value) => setState(() => milkTemperature = value!),
    );
  }

  Widget buildMilkFoamSelector() {
    return buildDropdown(
      label: 'Milk Foam',
      value: milkFoam,
      items: ['No Foam', 'Light', 'Normal', 'Extra'],
      onChanged: (value) => setState(() => milkFoam = value!),
    );
  }

  Widget buildIceLevelSelector() {
    return buildDropdown(
      label: 'Ice Level',
      value: iceLevel,
      items: ['No Ice', 'Light', 'Normal', 'Extra'],
      onChanged: (value) => setState(() => iceLevel = value!),
    );
  }

  Widget buildWhippedCreamSelector() {
    return buildDropdown(
      label: 'Whipped Cream',
      value: whippedCream,
      items: ['No', 'Light', 'Regular', 'Extra'],
      onChanged: (value) => setState(() => whippedCream = value!),
    );
  }

  Widget buildEspressoShotsCounter() {
    return buildCounter(
      label: 'Espresso Shots',
      value: espressoShots,
      onIncrement: () => setState(() => espressoShots++),
      onDecrement: () {
        if (espressoShots > 1) setState(() => espressoShots--);
      },
    );
  }

  // Reusable components
  Widget buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      items: items
          .map((item) => DropdownMenuItem(value: item, child: Text(item)))
          .toList(),
      onChanged: onChanged,
      decoration:
          InputDecoration(labelText: label, border: const OutlineInputBorder()),
    );
  }

  Widget buildCounter({
  required String label,
  required int value,
  required VoidCallback onIncrement,
  required VoidCallback onDecrement,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(label),
      Row(
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: onDecrement,
          ),
          Text(value.toString()),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: onIncrement,
          ),
        ],
      ),
    ],
  );
}
}