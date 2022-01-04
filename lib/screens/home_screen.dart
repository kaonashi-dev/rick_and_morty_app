import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rick_and_morty_app/services/services.dart';

class HomeScreen extends StatelessWidget {
   
   const HomeScreen({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {

      // final size = MediaQuery.of(context).size;
      final charactersService = Provider.of<CharactersService>(context);

      return Scaffold(
         appBar: AppBar(
            title: const Text('Rick and Morty'),
            centerTitle: true,
         ),
         body: SafeArea(
            child: GridView.count(
               crossAxisCount: 2,
               children: List.generate(charactersService.characters.length, (index) {
                  return Center(
                     child: Text(
                        charactersService.characters[index].name,
                        style: Theme.of(context).textTheme.headline5,
                     ),
                  );
               }),
            ),
         ),
      );
   }
}