import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rick_and_morty_app/services/services.dart';
import 'package:rick_and_morty_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
   const HomeScreen({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {

      final charactersService = Provider.of<CharactersService>(context);
      final favoritesService = Provider.of<FavoritesService>(context);

      return Scaffold(
         appBar: AppBarWidget.headerApp(favoritesService),
         body: ( charactersService.isLoading )
         ? const LoadingWidget()
         :SafeArea(
            child: GridView.builder(
               gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
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