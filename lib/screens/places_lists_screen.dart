import 'package:flutter/material.dart';
import 'package:native_app/providers/great_places.dart';
import 'package:native_app/screens/add_place_Screen.dart';
import 'package:provider/provider.dart';

class PlaceListsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your posts"),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
                })
          ],
        ),
        body: FutureBuilder(
          future: Provider.of<GreatPlaces>(context, listen: false)
              .fetchAndSetPlaces(),
          builder: (ctx, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? Center(child: CircularProgressIndicator())
              : Consumer<GreatPlaces>(
                  child: Center(
                    child: Text('no places yet, start adding'),
                  ),
                  builder: (ctx, greatPlaces, ch) =>
                      greatPlaces.items.length <= 0
                          ? ch
                          : ListView.builder(
                              itemCount: greatPlaces.items.length,
                              itemBuilder: (context, index) => ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                      FileImage(greatPlaces.items[index].image),
                                ),
                                title: Text(
                                  greatPlaces.items[index].title,
                                ),
                                onTap: () {},
                              ),
                            )),
        ));
  }
}
