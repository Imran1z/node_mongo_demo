import 'dart:convert'; // Importing the 'convert' module for JSON handling
import 'package:flutter/cupertino.dart'; // Importing Flutter's Cupertino package
import 'package:http/http.dart' as http; // Importing HTTP package for making requests
import 'package:node_mongo_demo/model/product_model.dart'; // Importing a model for product data

class API {
  static const baseUrl = "http://192.168.255.235:2000/api/"; // API base URL

  // Method to add a product
  static addProduct(Map pdata) async {
    var url = Uri.parse("${baseUrl}add_product"); // Constructing the URL
    try {
      final res = await http.post(url, body: pdata); // Sending a POST request

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body); // Decoding the JSON response
        print(data); // Printing the response data
      } else {
        print('Failed to get a response'); // Handling errors
      }
    } catch (e) {
      debugPrint(e.toString()); // Printing any caught exceptions
    }
  }

  // Method to get products
  static Future<List<Product>> getProduct() async {
    List<Product> products = []; // List to store fetched products
    var url = Uri.parse("${baseUrl}get_product"); // Constructing the URL

    try {
      final res = await http.get(url); // Sending a GET request

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body); // Decoding the JSON response

        data.forEach((value) {
          // Creating Product instances from the response data and adding to the list
          products.add(Product(
            name: value['pname'],
            price: value['pprice'],
            desc: value['pdesc'],
            id: value['id'].toString(),
          ));
        });

        return products; // Returning the list of products

      } else {
        return []; // Handling errors by returning an empty list
      }
    } catch (e) {
      debugPrint(e.toString()); // Printing any caught exceptions
      return []; // Handling errors by returning an empty list
    }
  }

  // Method to update a product
  static updateProduct(id, body) async {
    var url = Uri.parse(baseUrl + "update_product/$id"); // Constructing the URL

    try {
      final res = await http.patch(url, body: body); // Sending a PATCH request

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body); // Decoding the JSON response
        print(data); // Printing the response data
      } else {
        print('Failed to update'); // Handling errors
      }
    } catch (e) {
      debugPrint(e.toString()); // Printing any caught exceptions
    }
  }

  // Method to delete a product
  static deleteProduct(id) async {
    var url = Uri.parse(baseUrl + "delete_product/$id"); // Constructing the URL

    try {
      final res = await http.delete(url); // Sending a DELETE request

      if (res.statusCode == 200) {
        print('Product deleted successfully');
        // var data = jsonDecode(res.body); // Decoding the JSON response
        // print(data); // Printing the response data
      } else {
        print('Failed to delete'); // Handling errors
      }
    } catch (e) {
      debugPrint(e.toString()); // Printing any caught exceptions
    }
  }
}
