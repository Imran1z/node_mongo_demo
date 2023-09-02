import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:node_mongo_demo/model/product_model.dart'; // Importing a model for product data
import 'servisec/api.dart'; // Importing an API service

class EditingScreen extends StatefulWidget {
  final Product data;
  const EditingScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<EditingScreen> createState() => _EditingScreenState();
}

class _EditingScreenState extends State<EditingScreen> {

  // Controllers for managing the input fields
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descController = TextEditingController();

  @override
  void initState() {
    // Initialize the input fields with the existing data
    nameController.text = widget.data.name.toString();
    priceController.text = widget.data.price.toString();
    descController.text = widget.data.desc.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),),
        centerTitle: true,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black), // Change back button color
        backgroundColor: Colors.white,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Input field for product name
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: 'Name',
                ),
              ),
            ),
          ),
          // Input field for product price
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: priceController,
                decoration: const InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: 'Price',
                ),
              ),
            ),
          ),
          // Input field for product description
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: descController,
                decoration: const InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: 'Description',
                ),
              ),
            ),
          ),
          // Button for editing the product
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: CupertinoColors.activeBlue,
                minimumSize: const Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                side: const BorderSide(color: CupertinoColors.activeBlue),
              ),
              onPressed: () {
                // Call the updateProduct method from the API service to edit the product
                API.updateProduct(widget.data.id, {
                  "pname": nameController.text,
                  "pprice": priceController.text,
                  "pdesc": descController.text,
                  "id": widget.data.id,
                });
                setState(() {});
              },
              child: const Text('Edit', style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
