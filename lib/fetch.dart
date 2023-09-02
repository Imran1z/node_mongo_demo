import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:node_mongo_demo/servisec/api.dart'; // Importing an API service

import 'model/product_model.dart'; // Importing a model for product data

class ReadScreen extends StatefulWidget {
  const ReadScreen({Key? key}) : super(key: key);

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),),
        centerTitle: true,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black), // Change back button color
        backgroundColor: Colors.white,
      ),

      body: FutureBuilder(
        // Fetch product data from API using the getProduct method
        future: API.getProduct(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) {
            // Display a loading indicator while data is being fetched
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // Retrieve the list of products from the snapshot data
            List<Product> pdata = snapshot.data;

            // Display the list of products using a ListView.builder
            return ListView.builder(
              itemCount: pdata.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(Icons.storage), // Leading icon
                  title: Text("${pdata[index].name}"), // Product name
                  subtitle: Text("${pdata[index].desc}"), // Product description
                  trailing: Text("${pdata[index].price }"), // Product price
                );
              },
            );
          }
        },
      ),
    );
  }
}
