import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class FavoritesService extends ChangeNotifier{

   final LocalStorage storage = LocalStorage('favorites');
   List<int> favorites = [];

   FavoritesService() {
      getFavorites();
   }

   getFavorites() async {
      final List<int> data = await storage.getItem('FAVORITES_APP') ?? [];
      favorites = data;
   }

   updateFavorites( int characterId, int action ) {
    
      if (action == 1) {
        favorites.add(characterId);
      } else {
        favorites.removeWhere((item) => item == characterId);
      }
    
      storage.setItem('FAVORITES_APP', favorites);
      notifyListeners();
   
   }

   bool isFavorite( int characterId ) {
      return favorites.contains(characterId);
   }
  
}