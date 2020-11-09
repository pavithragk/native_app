import 'package:flutter/material.dart';
import 'package:native_app/providers/great_places.dart';
import 'package:native_app/screens/add_place_Screen.dart';
import 'package:native_app/screens/places_lists_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme:
            ThemeData(primaryColor: Colors.indigo, accentColor: Colors.amber),
        home: PlaceListsScreen(),
        routes: {
          AddPlaceScreen.routeName: (ctx) => AddPlaceScreen(),
        },
      ),
    );
  }
}
