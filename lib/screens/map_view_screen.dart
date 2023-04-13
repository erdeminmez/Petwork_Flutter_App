import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:geocoding/geocoding.dart';
import 'package:petwork/utils/colors.dart';

class MapViewScreen extends StatefulWidget {
  final address;
  const MapViewScreen({Key? key, required this.address}) : super(key: key);

  @override
  State<MapViewScreen> createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen> {

  @override
  void initState() {
    super.initState();
    goToPresencePlace();
}

  Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition initialPosition = CameraPosition(target: LatLng(33.47066110, -69.70144800), zoom: 14.0);


  Set<Marker> markers = {};


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: mobileBackgroundColor, title: const Text("Google Map View"), centerTitle: false,),
      body: GoogleMap(initialCameraPosition: initialPosition, markers: markers, zoomControlsEnabled: false, mapType: MapType.normal, onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: () {goToPresencePlace();}, label: Text("Go Presence"),
      icon: const Icon(Icons.location_on),),
    );
  }

  Future<void> goToPresencePlace() async {
    final GoogleMapController controller = await _controller.future;
    Location location = await getCoordinates(widget.address); // Wait for the result here
    if (location != null) {
      CameraPosition presencePosition = CameraPosition(target: LatLng(location.latitude, location.longitude), zoom: 14.0);

      controller.animateCamera(CameraUpdate.newCameraPosition(presencePosition));

      markers.clear();
      markers.add(Marker(markerId: const MarkerId('presenceLocation'), position: LatLng(location.latitude, location.longitude)));

      setState(() {});
    } else {
      // Handle the case where getCoordinates returns null
    }
  }


  Future<Location> getCoordinates(String givenAddress) async {
    try {
      List<Location> locations = await locationFromAddress(givenAddress);
      if (locations.isNotEmpty) {
        Location first = locations.first;
        return first;
      }
      throw Exception("No location found for address: $givenAddress");
    } catch (e) {
      print(e.toString());
      throw Exception("Error getting location for address: $givenAddress");
    }
  }




}
