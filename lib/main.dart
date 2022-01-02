import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
      return MaterialApp(
         title: 'Rick and Morty',
         home: Scaffold(
         appBar: AppBar(
            title: const Text('Rick and Morty'),
         ),
         body: Center(
            child: Container(
               child: Text('Rick and Morty'),
            ),
         ),
         ),
      );
   }
}