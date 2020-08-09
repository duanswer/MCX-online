import 'package:google_maps_flutter/google_maps_flutter.dart';

class LoadMarker {
  Set<Marker> localMarker = {};
  loadMarkers() {
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
    Marker _atm6 = Marker(
        markerId: MarkerId("ATM-5"),
        position: LatLng(-8.819473, 13.237505),
        infoWindow: InfoWindow(title: "ATM", snippet: "com notas"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
    Marker _atm7 = Marker(
        markerId: MarkerId("ATM-5"),
        position: LatLng(-8.819473, 13.237505),
        infoWindow: InfoWindow(title: "ATM", snippet: "com notas"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));
    Marker _atm8 = Marker(
        markerId: MarkerId("ATM-5"),
        position: LatLng(-8.819473, 13.237505),
        infoWindow: InfoWindow(title: "ATM", snippet: "com notas"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed));

    localMarker.add(_atm1);
    localMarker.add(_atm2);
    localMarker.add(_atm3);
    localMarker.add(_atm4);
    localMarker.add(_atm5);
    localMarker.add(_atm6);
    localMarker.add(_atm7);
    localMarker.add(_atm8);
  }
}
