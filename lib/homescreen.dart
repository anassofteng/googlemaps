import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  Completer<GoogleMapController> _controller=Completer();
  static final CameraPosition _kGooglePlex = const CameraPosition(target: LatLng(
      21.447559,39.866593
  ),
      zoom: 15.4764);

  List<Marker> _marker = [];
  List<Marker> _list=const [
    Marker(markerId: MarkerId('1'),
      position: LatLng(21.447559,39.866593),
      infoWindow: InfoWindow(
        title: 'my location',

      ),
    ),
    Marker(markerId: MarkerId('2'),
      position: LatLng(33.907611,73.387395),
      infoWindow: InfoWindow(
        title: 'Flat locaion',

      ),
    ),
    Marker(markerId: MarkerId('1'),
      position: LatLng(31.459859,73.080735),
      infoWindow: InfoWindow(
        title: 'Home',

      ),
    )
  ];

  @override
  void initState(){
    super.initState();
    _marker.addAll(_list);
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          markers: Set<Marker>.of(_marker),
          mapType: MapType.hybrid,
          myLocationEnabled: true,
          compassEnabled: true,
          onMapCreated: (GoogleMapController controller){
            _controller.complete(controller);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_searching_outlined),
        onPressed: ()async{
          GoogleMapController controller=await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(target: LatLng(31.459859,73.080735),
                  zoom: 14
              )
          ));
          setState(() {

          });
        },
      ),

    );
  }
}
