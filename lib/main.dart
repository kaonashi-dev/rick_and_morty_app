import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/constants/constants.dart';

import 'package:rick_and_morty_app/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
   
   const MyApp({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
      return MaterialApp(
         debugShowCheckedModeBanner: false,
         title: 'Rick and Morty',
         initialRoute: 'home',
         routes: Routes.routes,
         theme: AppTheme.theme(),
      );
   }
}