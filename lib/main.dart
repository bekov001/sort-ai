import 'dart:ui';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sortAI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'sortAI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectIndex = 0;
  late Widget _bodyWidget;

  @override
  void initState() {
    super.initState();
    onItemTepped(0);
  }

  void onItemTepped(int index) {
    setState(() {
      _selectIndex = index;
      _bodyWidget = _buildBodyWidget(index);
    });
  }


  Widget _buildBodyWidget(int widgetType) {
    switch (widgetType) {
      case 0:
        return Center(
          child: Material(
            color: Colors.green,
            borderRadius: BorderRadius.circular(28),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: InkWell(
              onTap: (){},
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Ink.image(
                    image: AssetImage('assets/photo_1.png'),
                    height: 150,
                    width: 185,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 6),
                  SizedBox(width: 5,),
                  Text('Plastic', style: TextStyle(fontSize: 18),),
                ],
              ),
            ),
          ),
        );
      case 1:
        return Center(
          child: Material(
            color: Colors.green,
            borderRadius: BorderRadius.circular(28),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: InkWell(
              onTap: (){void main() => runApp(const Map());},
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Ink.image(
                    image: AssetImage('assets/photo_camera.png'),
                    height: 150,
                    width: 185,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 6),
                  SizedBox(width: 5,),
                  Text('Camera', style: TextStyle(fontSize: 18),),
                ],
              ),
            ),
          ),
    );
      case 2:
        return Center(
          child: Material(
            color: Colors.green,
            borderRadius: BorderRadius.circular(28),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: InkWell(
              onTap: (){void main() => runApp(const Map());},
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Ink.image(
                    image: AssetImage('assets/photo_map.png'),
                    height: 150,
                    width: 185,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 6),
                  SizedBox(width: 5,),
                  Text('Camera', style: TextStyle(fontSize: 18),),
                ],
              ),
            ),
          ),
      );
    default:
    throw ArgumentError();
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _bodyWidget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectIndex,
        onTap: onItemTepped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Инфа',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Камера',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Карта',
          ),
        ],
        iconSize: 40,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
      ),
    );
  }
}

class Map extends StatelessWidget {
  const Map({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: CustomMap(),
      ),
    );
  }
}
class CustomMap extends StatefulWidget {
  const CustomMap({Key? key}) : super(key: key);

  @override
  _CustomMapState createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  GoogleMapController? _controller;
  static const LatLng _center = LatLng(48.864716, 2.349014);

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller = controller;
    });

    rootBundle.loadString('assets/map_style.json').then((mapStyle) {
      _controller?.setMapStyle(mapStyle);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: const CameraPosition(
        target: _center,
        zoom: 12,
      ),
    );
  }
}
