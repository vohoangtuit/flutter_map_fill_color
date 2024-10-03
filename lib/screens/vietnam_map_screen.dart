import 'package:countries_world_map/countries_world_map.dart';
import 'package:flutter/material.dart';
import 'package:zoom_widget/zoom_widget.dart';

class VietnamMapScreen extends StatefulWidget {
  const VietnamMapScreen({super.key});

  @override
  State<VietnamMapScreen> createState() => _VietnamMapScreenState();
}

class _VietnamMapScreenState extends State<VietnamMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Viet Nam'),
      ),
      body: Center(
        child: Zoom(
          backgroundColor: Colors.white,
            initTotalZoomOut: true,
            child: SimpleMap(
            // String of instructions to draw the map.
            instructions: SMapVietnam.instructions,
            // Default color for all countries.
            defaultColor: Colors.grey[400],
            colors: SMapVietnamColors(
              vnSG: Colors.green,
              vnHN: Colors.blue,
              vnDN: Colors.orangeAccent,
              vnCT: Colors.redAccent,
              vnHP: Colors.blueGrey,
              vn26: Colors.greenAccent,
              vn34: Colors.red,
              vn33: Colors.yellow,
              vn06: Colors.brown,
            ).toMap(),

            callback: (id, name, tapdetails) {
              print('$id - $name');
            },
            // markers:   [
            //   const SimpleMapMarker(
            //       markerSize: Size(50, 50),
            //       latLong: LatLong(latitude:106.7150679870901, longitude: 20.69685069425202),
            //       marker: Icon(
            //         Icons.location_on_rounded,
            //         color: Colors.black,
            //         size: 16,
            //       )),
            // ]

        ),
        ),
      ),
    );
  }
}
