import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class SfMapScreen extends StatefulWidget {
  const SfMapScreen({super.key});

  @override
  State<SfMapScreen> createState() => _SfMapScreenState();
}

class _SfMapScreenState extends State<SfMapScreen> {
  List<Model1>? _data;
  MapShapeSource? _mapSource;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('SfMap'),
      ),
      body: _data!=null? Center(
        child: SizedBox(
          child: _mapSource!=null?Center(
            child: SfMaps(
              layers: <MapShapeLayer>[
                MapShapeLayer(
                  source: _mapSource!,
                  // showDataLabels: true,
                  // legend: const MapLegend(
                  //   MapElement.shape,
                  //   position: MapLegendPosition.bottom,
                  //   overflowMode: MapLegendOverflowMode.scroll,
                  // ),
                  zoomPanBehavior: MapZoomPanBehavior(
                      enableDoubleTapZooming:true,
                      enableMouseWheelZooming:true
                  ),
                )

              ],
            ),
          ):Container(),
        ),
      ):Container(),
    );
  }
  @override
  void initState() {

    super.initState();
    _initDataSource();
  }
  _initDataSource(){
    setState(() {
      _data = <Model1>[
        const Model1('Vietnam', 0,Colors.redAccent,'Asia'),
        const Model1('Thailand', 0,Colors.blue,'Asia'),
        // const Model1('Italy', 0,Colors.blue,'Europe'),
        // const Model1('Liberia', 0,Colors.brown,'Africa'),
        // const Model1('Jamaica', 0,Colors.orangeAccent,'North America'),
        // const Model1('Guyana', 0,Colors.green,'South America'),
        // const Model1('Solomon Islands', 0,Colors.purple,'Australia'),
      ];

      _mapSource = MapShapeSource.asset("assets/world_map.json",
        shapeDataField: "name",// name | admin | continent
        dataCount: _data!.length,
        primaryValueMapper: (int index) => _data![index].country,
        shapeColorValueMapper: (int index) => _data![index].color,

      );
    });

  }
}
/// Collection of Australia state code data.
class Model {
  /// Initialize the instance of the [Model] class.
  const Model(this.state, this.color, this.stateCode);

  /// Represents the Australia state name.
  final String state;

  /// Represents the Australia state color.
  final Color color;

  /// Represents the Australia state code.
  final String stateCode;
}
class Model1 {
  const Model1(this.country, this.density, this.color, this.continent);

  final String continent;
  final String country;
  final double density;
  final Color color;
}
