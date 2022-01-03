import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
   const HomeScreen({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {

      final size = MediaQuery.of(context).size;
      
      return Scaffold(
         appBar: AppBar(
            title: const Text('Rick and Morty'),
            centerTitle: true,
         ),
         body: SafeArea(
            child: Column(

            ),
         ),
      );
   }
}