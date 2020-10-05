import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class StorePage extends StatefulWidget {
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  Completer<GoogleMapController> mapController = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(10.014251, 105.779441),
    zoom: 14.4746,
  );

  Set<Marker> markers = {
    Marker(
        markerId: MarkerId('store location'),
        position: LatLng(10.014251, 105.779441),
      infoWindow: InfoWindow(title: "79 Võ Nguyên Giáp", snippet: "Hưng Phú, Cái Răng, Cần Thơ")
      )
  };


  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    // TODO: ask me some questions in google search engine

    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        markers: markers,
        onMapCreated: (GoogleMapController controller) {
          mapController.complete(controller);
        },
      ),
    );
  }
}
