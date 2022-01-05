import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rick_and_morty_app/services/services.dart';
import 'package:rick_and_morty_app/widgets/widgets.dart';

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
            child: GridView.builder(
               gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 500,
                  childAspectRatio: 1,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0
               ),
               itemCount: charactersService.characters.length,
               itemBuilder: (BuildContext context, int index) {
                  return SimpleCardWidget(character: charactersService.characters[index]);
               }
            )
         ),
      );
   }
}