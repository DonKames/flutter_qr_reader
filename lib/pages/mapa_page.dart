import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_reader/model/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final scan = ModalRoute.of(context)?.settings.arguments as ScanModel;

    final CameraPosition puntoInicial = CameraPosition(
      target: scan.getLatLng(),
      zoom: 16,
    );

    //Marcadores
    Set<Marker> markers = Set<Marker>();
    markers.add(
      Marker(
        markerId: MarkerId('geo-location'),
        position: scan.getLatLng(),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
        actions: [
          IconButton(
            icon: Icon(Icons.location_on),
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                CameraUpdate.newCameraPosition(puntoInicial),
              );
            },
          ),
        ],
      ),
      body: GoogleMap(
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        mapType: MapType.normal,
        markers: markers,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.layers),
        onPressed: () {},
      ),
    );
  }
}
