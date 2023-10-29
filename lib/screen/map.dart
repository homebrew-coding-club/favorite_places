import 'package:favorite_places/models/places.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.location = const PlaceLocation(
      latitude: 37.422,
      longitude: -122.084,
      address: '',
    ),
    required this.isSelected,
  });

  final PlaceLocation location;
  final bool isSelected;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isSelected ? 'Pick your location' : 'your location',
        ),
        actions: [
          if (widget.isSelected)
            IconButton(
              icon: const Icon(
                Icons.save,
              ),
              onPressed: () {},
            )
        ],
      ),
      body: GoogleMap(
          onTap: (position) {
            setState(() {
              _pickLocation = position;
            });
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(
              widget.location.latitude,
              widget.location.longitude,
            ),
            zoom: 16,
          ),
          markers: (_pickLocation == null && widget.isSelected) ? {} :  {
            Marker(
              markerId: const MarkerId('m1'),
              position: _pickLocation ??
                  LatLng(
                    widget.location.latitude,
                    widget.location.longitude,
                  ),
            ),
          }),
    );
  }
}
