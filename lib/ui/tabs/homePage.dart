import 'dart:async';
import 'package:atm_online/helpers/load_markers.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();
  CameraPosition _positionCamera = CameraPosition(
    target: LatLng(-8.819705, 13.237043),
    zoom: 16,
  );
  Set<Marker> _markers = {};
  Set<Marker> _selectedAtm = {};

  _onMapCreated(GoogleMapController googleMapController) {
    _controller.complete(googleMapController);
  }

  _movingCamera() async {
    GoogleMapController googleMapController = await _controller.future;
    googleMapController
        .animateCamera(CameraUpdate.newCameraPosition(_positionCamera));
  }

  _loadMarkers() {
    Set<Marker> localMarker = {};
    Marker _atm1 = Marker(
        markerId: MarkerId("ATM-1"),
        position: LatLng(-8.819908, 13.236473),
        infoWindow: InfoWindow(title: "ATM com notas"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen));
    Marker _atm2 = Marker(
        markerId: MarkerId("ATM-2"),
        position: LatLng(-8.819499, 13.235901),
        infoWindow: InfoWindow(title: "ATM sem notas"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
    Marker _atm3 = Marker(
        markerId: MarkerId("ATM-3"),
        position: LatLng(-8.822333, 13.236174),
        infoWindow: InfoWindow(title: "ATM sem notas"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
    Marker _atm4 = Marker(
        markerId: MarkerId("ATM-4"),
        position: LatLng(-8.821221, 13.237686),
        infoWindow: InfoWindow(title: "ATM com notas"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen));
    Marker _atm5 = Marker(
        markerId: MarkerId("ATM-5"),
        position: LatLng(-8.819473, 13.237505),
        infoWindow: InfoWindow(title: "ATM sem notas"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
    Marker _atm6 = Marker(
        markerId: MarkerId("ATM-6"),
        position: LatLng(-8.818811, 13.236310),
        infoWindow: InfoWindow(title: "ATM com notas"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen));
    Marker _atm7 = Marker(
        markerId: MarkerId("ATM-7"),
        position: LatLng(-8.819797, 13.239099),
        infoWindow: InfoWindow(title: "ATM com notas"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen));
    Marker _atm8 = Marker(
        markerId: MarkerId("ATM-8"),
        position: LatLng(-8.818652, 13.238681),
        infoWindow: InfoWindow(title: "ATM com notas"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen));

    localMarker.add(_atm1);
    localMarker.add(_atm2);
    localMarker.add(_atm3);
    localMarker.add(_atm4);
    localMarker.add(_atm5);
    localMarker.add(_atm6);
    localMarker.add(_atm7);
    localMarker.add(_atm8);
    setState(() {
      _markers = localMarker;
    });
  }

  _getCurrentPosition() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _positionCamera = CameraPosition(
          target: LatLng(position.latitude, position.longitude), zoom: 17);
      _movingCamera();
    });
  }

  _addingListenerLocation() {
    var geolocator = Geolocator();
    var locationOptions = LocationOptions(
      accuracy: LocationAccuracy.best,
      distanceFilter: 10,
    );
    geolocator.getPositionStream(locationOptions).listen((Position position) {
      setState(() {
        _positionCamera = CameraPosition(
            target: LatLng(position.latitude, position.longitude), zoom: 17);
        _movingCamera();
      });
    });
  }

  //_showMarker
  _selectAtm(LatLng latLng) async {
    List<Placemark> atmAdress = await Geolocator()
        .placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    if (atmAdress != null && atmAdress.length > 0) {
      Placemark adressAtm = atmAdress[0];
      String street = adressAtm.thoroughfare;
      String locality = adressAtm.locality;
      String name = adressAtm.name;

      Marker marker = Marker(
          markerId: MarkerId("marker-${latLng.latitude}-${latLng.longitude}"),
          position: latLng,
          infoWindow: InfoWindow(title: "ATM" + locality, snippet: street));
      setState(() {
        _selectedAtm.add(marker);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadMarkers();
    _getCurrentPosition();
    _addingListenerLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _positionCamera,
          onMapCreated: _onMapCreated,
          markers: _markers,
          myLocationEnabled: true,
          onLongPress: _selectAtm,
        ),
      ),
    );
  }
}
