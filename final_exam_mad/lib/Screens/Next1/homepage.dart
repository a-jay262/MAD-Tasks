import 'package:final_exam_mad/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Screens/Add/add.dart';

class Item {
  final String title;
  final String image;
  double price;

  Item({required this.title, required this.image, required this.price});
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Item> items;

  @override
  void initState() {
    super.initState();
    // Fetch data from Firestore when the widget is initialized
    fetchDataFromFirestore();
  }

  Future<void> fetchDataFromFirestore() async {
    try {
      // Access the Firestore collection
      CollectionReference itemsCollection = FirebaseFirestore.instance.collection('items');

      // Get documents from the collection
      QuerySnapshot querySnapshot = await itemsCollection.get();

      // Map the documents to Item objects
      items = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Item(
          title: data['name'] ?? 'Default Item',
          image: 'assets/icons/home.jpeg', // You can update this with the actual image URL or path
          price: (data['price'] ?? 0.0).toDouble(),
        );
      }).toList();

      // Update the state to trigger a rebuild
      setState(() {});
    } catch (e) {
      print('Error fetching data from Firestore: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items'),
        backgroundColor: kPrimaryColor,
      ),
      body: items != null
          ? ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(
                    items[index].image,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(items[index].title),
                  subtitle: Text('\$${items[index].price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      _showEditDialog(index);
                    },
                  ),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        backgroundColor:kPrimaryColor, // Change color here
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  _showEditDialog(int index) async {
    TextEditingController priceController = TextEditingController();
    priceController.text = items[index].price.toString();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Price'),
          content: TextField(
            controller: priceController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton (
              child: Text('Save'),
              onPressed: () async {
                setState(() {
                  items[index].price = double.parse(priceController.text);
                });
                try {
                // Access the Firestore collection
                CollectionReference itemsCollection = FirebaseFirestore.instance.collection('items');

                // Update the document with the edited data
                await itemsCollection.doc('your_document_id').update({
                  'price': items[index].price,
                });

                print('Data updated in Firestore successfully!');
              } catch (e) {
                print('Error updating data in Firestore: $e');
              }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _addItem() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AddItemPage();
        },
      ),
    );
  }
}
