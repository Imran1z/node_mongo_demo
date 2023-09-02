import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:node_mongo_demo/editing.dart';

import 'model/product_model.dart';
import 'servisec/api.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),),
        centerTitle: true,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black), // Change back button color
        backgroundColor: Colors.white,),
      body: FutureBuilder(
        future: API.getProduct(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(!snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else{
            List<Product> pdata =snapshot.data;
            return ListView.builder(
                itemCount: pdata.length,
                itemBuilder: ( BuildContext context, int index){
                  return ListTile(
                    leading: IconButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> EditingScreen(data: pdata[index])));
                    }, icon: Icon(Icons.update),),
                    title: Text("${pdata[index].name}"),
                    subtitle: Text("${pdata[index].desc}"),
                    trailing: Text("${pdata[index].price }"),


                  );
                });
          }
        },

      ),
    );
  }
}
