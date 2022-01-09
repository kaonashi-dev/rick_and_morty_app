import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class FavoritesService extends ChangeNotifier{

   final LocalStorage storage = LocalStorage('favorites');
   final List<int> favorites = [];

   List getFavorites( String key ) {
      final List data = storage.getItem(key) ?? [];
      return data;
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