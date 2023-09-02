import 'package:flutter/material.dart';
import 'package:node_mongo_demo/create.dart';
import 'package:node_mongo_demo/delete.dart';
import 'package:node_mongo_demo/fetch.dart';
import 'package:node_mongo_demo/home.dart';
import 'package:node_mongo_demo/editing.dart';
import 'package:node_mongo_demo/update.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        '/create':(context)=> const CreateScreen(),
        '/read':(context)=> const ReadScreen(),
        '/update':(context)=> const UpdateScreen(),
        '/delete':(context)=> const DeleteScreen(),


      },
      home: const HomeScreen(),

    );
  }
}

