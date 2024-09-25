import 'dart:math';
import 'package:fl_geocoder/fl_geocoder.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

class LocationProvider extends ChangeNotifier {
  LatLng? selectedLocation;
  final CameraPosition defaultLocation = const CameraPosition(
    target: LatLng(27.908654567741547, -82.45942870997152),
    zoom: 19,
  );
  String? address;
  Set<Marker> markers = {};
  bool showInviteCard = false;
  final geocode = FlGeocoder("AIzaSyCKexzRg44EKvLtQMLu389EiWvJ0yhGxSo");

  void updateLocation(LatLng location) {
    selectedLocation = location;
    notifyListeners();
  }

  void updateAddress(String address) {
    this.address = address;
    notifyListeners();
  }

  void toggleInviteCard(bool shouldShowInviteCard) {
    showInviteCard = shouldShowInviteCard;
    notifyListeners();
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  void createDefaultMarker() async {
    final addr = (await geocode.findAddressesFromLocationCoordinates(
      location: Location(
          defaultLocation.target.latitude, defaultLocation.target.longitude),
    ))
        .first;

    updateAddress(
      "${addr.formattedAddress}",
    );

    final marker = Marker(
      markerId: const MarkerId(
        "SelectedMarker",
      ),
      position: LatLng(
        defaultLocation.target.latitude,
        defaultLocation.target.longitude,
      ),
      icon: await Container(
        padding: const EdgeInsets.all(2),
        width: 64,
        height: 64,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset("assets/bg.png"),
        ),
      ).toBitmapDescriptor(),
    );

    markers.add(marker);
    notifyListeners();
  }

  void createNewMarkerMarker() async {
    final addr = (await geocode.findAddressesFromLocationCoordinates(
      location: Location(
        selectedLocation?.latitude ?? defaultLocation.target.latitude,
        selectedLocation?.longitude ?? defaultLocation.target.longitude,
      ),
    ))
        .first;

    updateAddress(
      "${addr.formattedAddress}",
    );

    final marker = Marker(
      markerId: const MarkerId(
        "SelectedMarker",
      ),
      position: selectedLocation ??
          LatLng(
            defaultLocation.target.latitude,
            defaultLocation.target.longitude,
          ),
      icon: await Container(
        padding: const EdgeInsets.all(2),
        width: 64,
        height: 64,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              Color(0XFFC5FF00),
              Color(0XFFC5FF00),
              Color(0XFFC5FF00),
              Color(0XFFC5FF00),
              Color.fromARGB(80, 195, 255, 0),
            ],
          ),
        ),
      ).toBitmapDescriptor(),
    );

    markers.add(marker);
    notifyListeners();
  }
}
