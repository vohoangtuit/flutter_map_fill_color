import 'package:countries_world_map/data/maps/world_map.dart';
import 'package:flutter/material.dart';
import 'package:countries_world_map/countries_world_map.dart';
import 'package:zoom_widget/zoom_widget.dart';
class WorldMapScreen extends StatefulWidget {
  const WorldMapScreen({super.key});

  @override
  State<WorldMapScreen> createState() => _WorldMapScreenState();
}

class _WorldMapScreenState extends State<WorldMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text('World Map'),),
      body: _viewContent(),
    );
  }
  Widget _viewContent(){
    return _countries();
  }
  Widget _countries(){
    return Center(
      child: Zoom(
        backgroundColor: Colors.white,
        initTotalZoomOut: true,
        child: SimpleMap(
          // String of instructions to draw the map.
          instructions: SMapWorld.instructions,
          // Default color for all countries.
          defaultColor: Colors.grey[400],

          colors: SMapWorldColors(
            tH: Colors.brown,
            aU: Colors.yellow,
            uS: Colors.orangeAccent,
            uA: Colors.redAccent,
            bR: Colors.blue,
            aF: Colors.purple,
            iN: Colors.cyan,
            sD: Colors.deepPurple,
            zM: Colors.lightGreenAccent,
            rU: Colors.blueGrey,

          ).toMap(),
          callback: (id, name, tapdetails) {
            /// todo: get country name : https://github.com/simplewidgets/countries_world_map/issues/12
            print('$id - $name - ${tapdetails.toString()}');
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
    );
  }
}
