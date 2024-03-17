import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class convert extends StatefulWidget {
  const convert({Key? key}) : super(key: key);

  @override
  State<convert> createState() => _convertState();
}

class _convertState extends State<convert> {
  String staddress = '', stadd = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('conversion'))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(staddress),
          Text(stadd),
          GestureDetector(
            onTap: () async {
              //convert address
              List<Location> locations =
                  await locationFromAddress("Gronausestraat 710, Enschede");
              List<Placemark> placemarks =
                  await placemarkFromCoordinates(52.2165157, 6.9437819);

              setState(() {
                staddress = locations.last.longitude.toString() +
                    "  " +
                    locations.last.latitude.toString();
                stadd = placemarks.reversed.last.country.toString() +
                    "  " +
                    placemarks.reversed.last.locality.toString();
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(color: Colors.green),
                  child: Center(
                    child: Text('convert'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
