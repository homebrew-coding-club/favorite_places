import 'package:favorite_places/screen/add_place.dart';
import 'package:favorite_places/widget/places_list.dart';
import 'package:flutter/material.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=> const AddPlaceScreen(),),
              );
            },
          ),
        ],
      ),
      body: const PlacesList(
        places: [],
      ),
    );
  }
}
