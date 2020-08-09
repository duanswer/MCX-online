import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};

  _onMapCreated(GoogleMapController googleMapController) {
    _controller.complete(googleMapController);
  }

  _loadMarkers() {
    Set<Marker> localMarker = {};
    Marker _atm1 = Marker(
        markerId: MarkerId("ATM-1"),
        position: LatLng(-8.819908, 13.236473),
        infoWindow: InfoWindow(title: "ATM", snippet: "com notas"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen));
    Marker _atm2 = Marker(
        markerId: MarkerId("ATM-2"),
        position: LatLng(-8.819499, 13.235901),
        infoWindow: InfoWindow(title: "ATM", snippet: "sem notas"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
    Marker _atm3 = Marker(
        markerId: MarkerId("ATM-3"),
        position: LatLng(-8.822333, 13.236174),
        infoWindow: InfoWindow(title: "ATM", snippet: "sem notas"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
    Marker _atm4 = Marker(
        markerId: MarkerId("ATM-4"),
        position: LatLng(-8.821221, 13.237686),
        infoWindow: InfoWindow(title: "ATM", snippet: "com notas"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen));
    Marker _atm5 = Marker(
        markerId: MarkerId("ATM-5"),
        position: LatLng(-8.819473, 13.237505),
        infoWindow: InfoWindow(title: "ATM", snippet: "com notas"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));

    localMarker.add(_atm1);
    localMarker.add(_atm2);
    localMarker.add(_atm3);
    localMarker.add(_atm4);
    localMarker.add(_atm5);
    setState(() {
      _markers = localMarker;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: LatLng(-8.819705, 13.237043),
            zoom: 16,
          ),
          onMapCreated: _onMapCreated,
          markers: _markers,
        ),
      ),
    );
  }
}
