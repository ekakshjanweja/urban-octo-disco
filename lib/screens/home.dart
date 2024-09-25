import 'dart:async';
import 'package:domi_labs_test/core/location_provider.dart';
import 'package:domi_labs_test/widgets/bottom_sheet.dart';
import 'package:domi_labs_test/widgets/custom_app_bar.dart';
import 'package:domi_labs_test/widgets/invite_card.dart';
import 'package:fl_geocoder/fl_geocoder.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Completer<GoogleMapController> _googleMapController =
      Completer<GoogleMapController>();

  final DraggableScrollableController _draggableScrollableController =
      DraggableScrollableController();

  final geocode = FlGeocoder("AIzaSyCKexzRg44EKvLtQMLu389EiWvJ0yhGxSo");

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final lp = Provider.of<LocationProvider>(context, listen: false);
      lp.createDefaultMarker();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LocationProvider>(
        builder: (context, lp, _) {
          return Stack(
            children: [
              //Google Map

              GoogleMap(
                cloudMapId: "3c809e8afe5f776",
                markers: lp.markers,
                onTap: (latLng) async {
                  lp.updateLocation(latLng);

                  final addr =
                      (await geocode.findAddressesFromLocationCoordinates(
                    location: Location(latLng.latitude, latLng.longitude),
                  ))
                          .first;

                  lp.updateAddress(
                    "${addr.formattedAddress}",
                  );

                  final distance = lp.calculateDistance(
                    lp.defaultLocation.target.latitude,
                    lp.defaultLocation.target.longitude,
                    latLng.latitude,
                    latLng.longitude,
                  );

                  if (distance > 0.01) {
                    lp.toggleInviteCard(true);
                    lp.createNewMarkerMarker();
                  } else {
                    lp.toggleInviteCard(false);
                    lp.createDefaultMarker();
                  }

                  setState(() {});
                },
                mapType: MapType.normal,
                initialCameraPosition: lp.defaultLocation,
                onMapCreated: (GoogleMapController controller) {
                  _googleMapController.complete(controller);
                },
              ),

              //AppBar

              const CustomAppBar(),

              //Draggable Bottom Sheet

              Visibility(
                visible: !lp.showInviteCard,
                replacement: const InviteCard(),
                child: DraggableScrollableSheet(
                  controller: _draggableScrollableController,
                  shouldCloseOnMinExtent: true,
                  minChildSize: 0.17,
                  initialChildSize: 0.17,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return InfoBottomSheet(
                      scrollController: scrollController,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
