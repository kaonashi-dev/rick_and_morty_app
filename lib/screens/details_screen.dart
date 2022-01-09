import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rick_and_morty_app/models/models.dart';
import 'package:rick_and_morty_app/services/services.dart';

class DetailsScreeen extends StatelessWidget {

   const DetailsScreeen({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {

      final character = ModalRoute.of(context)!.settings.arguments as Character;
      final favoritesService = Provider.of<FavoritesService>(context);
      
      return  Scaffold(
         body: CustomScrollView(
            slivers: [
               _appBar(context, character),

               SliverToBoxAdapter(
                  child: SizedBox(
                     height: 30,
                     child: Center(
                        child: Text(character.name, style: const TextStyle(fontSize: 19)),
                     ),
                  )
               ),

               _sliverBody(context, character),
               
            ]
         ),
         floatingActionButton: FloatingActionButton(
            child: favoritesService.isFavorite(character.id)
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border),
            onPressed: ( ) {

               final isFavorite = favoritesService.isFavorite(character.id);
               final action = (isFavorite) ? 2: 1;

               favoritesService.updateFavorites(character.id, action);

            }
         ),
      );
   }

   SliverList _sliverBody(BuildContext context, Character character) {
      return SliverList(
         delegate: SliverChildListDelegate([
            Container(
               height: MediaQuery.of(context).size.height,
               width: 300,
               color: Colors.white,
               child: Column(
                  children: [
                     ListTile(
                        leading: const Icon(Icons.local_hospital_rounded),
                        title: Text('' + character.status),
                        subtitle:const Text('Status'),
                     ),
                     ListTile(
                        leading: const Icon(Icons.emoji_people_rounded),
                        title: Text('' + character.species),
                        subtitle:const Text('Species'),
                     ),
                     ListTile(
                        leading: const Icon(Icons.transgender),
                        title: Text('' + character.gender),
                        subtitle:const Text('Gender'),
                     ),
                  ],
               ),
            )
         ]),
      );
   }

   SliverAppBar _appBar(BuildContext context, Character character) {
      return SliverAppBar(
         pinned: true,
         expandedHeight: MediaQuery.of(context).size.height * 0.39,
         flexibleSpace: FlexibleSpaceBar(
            title: Text(character.name),
            background: Image.network(character.image, fit: BoxFit.cover,),
         ),
      );
   }
}