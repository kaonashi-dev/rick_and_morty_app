import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'package:rick_and_morty_app/constants/constants.dart';
import 'package:rick_and_morty_app/routes/routes.dart';

import 'package:rick_and_morty_app/services/services.dart';

void main() async {
      
   await dotenv.load();

   runApp(const StateApp());

}

class StateApp extends StatelessWidget {
   
   const StateApp({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
      return MultiProvider(
         providers: [
            ChangeNotifierProvider(create: ( _ ) => CharactersService()),
         ],
         child: const MyApp(),
      );
   }
}

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