import 'package:flutter/material.dart';

import 'package:rick_and_morty_app/models/models.dart';

class DetailsScreeen extends StatelessWidget {

   const DetailsScreeen({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {

      final character = ModalRoute.of(context)!.settings.arguments as Character;
      
      return  Scaffold(
         body: CustomScrollView(
            slivers: [
               SliverAppBar(
                  pinned: true,
                  expandedHeight: MediaQuery.of(context).size.height * 0.39,
                  flexibleSpace: FlexibleSpaceBar(
                     title: Text(character.name),
                     background: Image.network(character.image, fit: BoxFit.cover,),
                  ),
               ),
            ]
         ),
      );
   }
}