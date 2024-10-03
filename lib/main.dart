import 'package:flutter/material.dart';
import 'package:sfmap/screens/vietnam_map_screen.dart';
import 'package:sfmap/screens/world_map_screen.dart';
import 'package:sfmap/screens/sf_map_screen.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Map demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, });


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: const Text('Demo fill color map'),
    ),
     body: _viewContent(),
    );
  }
  Widget _viewContent(){
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            _button('SF Map',(){
              addScreen(const SfMapScreen());
            }),
            _button('World Map',(){
              addScreen(const WorldMapScreen());
            }),
            _button('VietNam Map',(){
              addScreen(const VietnamMapScreen());
            }),
          ],
        ),
      ),
    );
  }
  @override
  void initState() {

    super.initState();
  }
  Widget _button(String title, VoidCallback addScreen){
    return InkWell(
      onTap: addScreen,
      child: Container(
        height: 30,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.cyan,
        ),
        margin: const EdgeInsets.all(10),
        child: Center(child: Text(title,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),),),
      ),
    );
  }

  addScreen(Widget screen){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  screen));
  }
}
