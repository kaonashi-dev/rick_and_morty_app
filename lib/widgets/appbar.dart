import 'package:flutter/material.dart';

import 'package:rick_and_morty_app/services/services.dart';

class AppBarWidget {
   
   static AppBar headerApp(FavoritesService favoritesService) {
      return AppBar(
         title: const Text('Rick and Morty'),
         centerTitle: true,
         actions: [
            Container(
               padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10
               ),
               child: Stack(
                  children: [
                     const Icon( Icons.favorite_sharp, size: 30, ),
                     Positioned(
                        top: -1,
                        right: 3,
                        child: Container(
                           padding: const EdgeInsets.all(1),
                           decoration: BoxDecoration(
                              color: Colors.indigoAccent,
                              borderRadius: BorderRadius.circular(30)
                           ),
                           child: Text(favoritesService.favorites.length.toString())
                        ),
                     )
                  ],
               ),
            )
         ],
      );
   }
}