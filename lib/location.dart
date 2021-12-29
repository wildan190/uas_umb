import 'dart:async';
//import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/foundation.dart';
//import 'package:hive_demo/main.dart';
//import 'package:hive_demo/main.dart';
//import 'package:hive_demo/start.dart';

void main() {
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
}

class MyMaps extends StatefulWidget {
  const MyMaps({Key? key}) : super(key: key);

  @override
  _MyMapsState createState() => _MyMapsState();
}

class _MyMapsState extends State<MyMaps> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _startPosition =
      CameraPosition(target: LatLng(-6.209337, 106.738633), zoom: 14.4746);
  static final CameraPosition _umbPosition = CameraPosition(
      target: LatLng(-6.209337, 106.738633), zoom: 19.151926040649414);

  Future<void> _goToUMBLocation() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_umbPosition));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UMB Location'),
        centerTitle: true,
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _startPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToUMBLocation,
        label: Text('Go To UMB'),
        icon: Icon(Icons.zoom_in),
      ),
    );
  }
}
/*import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Maps Sample App'),
            backgroundColor: Colors.green[700],
          ),
          body: Stack(
            children: <Widget>[
              GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: LatLng(-33.870840, 151.206286), zoom: 12))
            ],
          )),
    );
  }
}*/

