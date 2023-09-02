import 'package:flutter/material.dart';
import 'package:node_mongo_demo/utilities/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Home',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),),
        centerTitle: true,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black), // Change back button color
        backgroundColor: Colors.white,

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(text: 'Create', onPressed: (){
              Navigator.pushNamed(context, '/create');
            }),
            CustomButton(text: 'Read', onPressed: (){
              Navigator.pushNamed(context, '/read');

            }),
            CustomButton(text: 'Update', onPressed: (){
              Navigator.pushNamed(context, '/update');

            }),
            CustomButton(text: 'Delete', onPressed: (){
              Navigator.pushNamed(context, '/delete');
            }),


          ],
        ),
      ),

    );
  }
}
