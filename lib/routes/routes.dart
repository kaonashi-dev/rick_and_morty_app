import 'package:flutter/material.dart';

import 'package:rick_and_morty_app/screens/screens.dart';

class Routes {

   static const String home = 'home';
   static const String details = 'details';

   static final routes = <String, WidgetBuilder>{
      home: (BuildContext context) => const HomeScreen(),
      details: (BuildContext context) => const DetailsScreeen(),
   };
}
