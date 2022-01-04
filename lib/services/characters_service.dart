import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:rick_and_morty_app/models/models.dart';

class CharactersService extends ChangeNotifier {

   final String _baseUrl = dotenv.get('API_URL');

   final List<Character> characters = [];

   bool isLoading = false;

   CharactersService() {
      fetchCharacters();
   }

   Future<List<Character>> fetchCharacters() async {

      isLoading = true;
      notifyListeners();

      final response = await http.get(Uri.parse('$_baseUrl/character'));

      if (response.statusCode == 200) {
         
         final Map<String, dynamic> jsonData = jsonDecode(response.body);
         // final results = jsonData['results'];
         if ( jsonData.containsKey('results') ) {
            final List<dynamic> results = jsonData['results'];
            for (var element in results) {
               final tempCharacter = Character.fromMap(element);
               characters.add(tempCharacter);
            }
         } else {
            // ignore: avoid_print
            print('ERROR');
         }

         isLoading = false;
         notifyListeners();
         
         return characters;

      } else {
         throw Exception('Failed to load characters');
      }

   }

}