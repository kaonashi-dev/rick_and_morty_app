import 'package:flutter/material.dart';

import 'package:rick_and_morty_app/models/models.dart';
import 'package:rick_and_morty_app/widgets/widgets.dart';

class SimpleCardWidget extends StatelessWidget {
   
   final Character character;
   const SimpleCardWidget({Key? key, required this.character}) : super(key: key);

   @override
   Widget build(BuildContext context) {

      return GestureDetector(
         child: Container(
            height: 300,
            width: 300,
            margin: const EdgeInsets.all(19),
            decoration: _boxDecoration(),
            child: ClipRRect(
               borderRadius: BorderRadius.circular(15),
               child: _bodyCard(context)
            ),
         ),
         onTap: () {
            Navigator.pushNamed(context, 'details', arguments: character);
         },
      );
   }

   Stack _bodyCard(BuildContext context) {

      final size = MediaQuery.of(context).size;

      return Stack(
         children: [
               
            Image.network(
               character.image, 
               fit: BoxFit.cover, 
               width: size.width,
               loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const LoadingWidget();
               },
            ),
            
            Container(
               padding: const EdgeInsets.all(9),
               child: Text(
                  character.name,
                  maxLines: 3,
                  style: const TextStyle(
                     color: Colors.black,
                     fontSize: 19,
                     fontWeight: FontWeight.bold,
                     overflow: TextOverflow.ellipsis
                  ),
               )
            ),
         ],
      );
   }

   BoxDecoration _boxDecoration() => BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
         BoxShadow(
            blurRadius: 9,
            color: Colors.black.withOpacity(0.5)
         )
      ]
   );
}