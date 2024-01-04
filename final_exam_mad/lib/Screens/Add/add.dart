import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Screens/Next1/homepage.dart';
import '../../constants.dart';

class AddItemPage extends StatefulWidget {
  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final TextEditingController dishNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController resIdController = TextEditingController();

  String dishType = 'Veg'; // Default dish type
  bool isAvailable = true; // Default availability

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dish ID: ${generateDishId()}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextField(
              controller: dishNameController,
              decoration: InputDecoration(labelText: 'Dish Name'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Price'),
            ),
            SizedBox(height: 16),
            Text('Dish Type:'),
            DropdownButton<String>(
              value: dishType,
              onChanged: (newValue) {
                setState(() {
                  dishType = newValue!;
                });
              },
              items: ['Veg', 'Non-Veg', 'Vegan', 'Gluten-Free']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text('Availability:'),
            Row(
              children: [
                Radio(
                  value: true,
                  groupValue: isAvailable,
                  onChanged: (value) {
                    setState(() {
                      isAvailable = value as bool;
                    });
                  },
                ),
                Text('Available'),
                Radio(
                  value: false,
                  groupValue: isAvailable,
                  onChanged: (value) {
                    setState(() {
                      isAvailable = value as bool;
                    });
                  },
                ),
                Text('Not Available'),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              controller: resIdController,
              decoration: InputDecoration(labelText: 'Restraunt Id'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add logic to save the item
                saveItem();
              },
              child: Text('Save'),
              style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor), // Change color here
            ),
            ),
          ],
        ),
      ),
    );
  }

  String generateDishId() {
    // You can implement your logic to generate a unique dish ID here.
    // For simplicity, using a timestamp.
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  void saveItem() async {
    // Add logic to save the item with the provided details.
    String dishId = generateDishId();
    String dishName = dishNameController.text;
    double price = double.tryParse(priceController.text) ?? 0.0;

    // You can use the captured values (dishId, dishName, price, dishType, isAvailable) to save the item.
    // For now, printing them to the console.
    print('Dish ID: $dishId');
    print('Dish Name: $dishName');
    print('Price: $price');
    print('Dish Type: $dishType');
    print('Availability: $isAvailable');
    try {
      // Access the Firestore collection
      CollectionReference items =
          FirebaseFirestore.instance.collection('items');

      // Add a document to the "users" collection
      await items.add({
        'dishId': dishId,
        'name': dishName,
        'price': price,
        'type': dishType,
        'resId': resIdController.text,
      });

      print('Data added to Firestore successfully!');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage();
          },
        ),
      );
    } catch (e) {
      print('Error adding data to Firestore: $e');
    }
  }
}
