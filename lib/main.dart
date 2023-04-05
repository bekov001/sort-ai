import 'dart:io';

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
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MyPlasticPage()));}, child: Text('Plastic')
                ),
                ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MyPlasticPage()));}, child: Text('Paper')
                ),
                ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MyPlasticPage()));}, child: Text('Glass')
                ),
                ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MyPlasticPage()));}, child: Text('E-Waste')
                ),
                ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MyPlasticPage()));}, child: Text('Metal')
                ),
                ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MyPlasticPage()));}, child: Text('Medical Waste')
                )
              ],
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
              onTap: (){},
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
                  Text('Map', style: TextStyle(fontSize: 18),),
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
  static const LatLng _center = LatLng(43.250000, 76.900000);

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
      markers: {
        Marker(
            markerId: const MarkerId('marker1'),
            position: const LatLng(43.283238028738154, 76.91747813647363),
            draggable: true,
            onDragEnd: (value) {
              // value is the new position
            },
            infoWindow: InfoWindow(
              title: 'Прием вторсырья',
              snippet:
              ['Центр по переработке отходов', '+77017442643', 'улица Казыбаева 26, Алматы'].join(", "),
            )
          // To do: custom marker icon
        ),

        Marker(
            markerId: const MarkerId('marker2'),
            position: const LatLng(43.29501417896099, 76.85756449315723),
            infoWindow: InfoWindow(
              title: 'ТОО "КазМакТрейд" пункт приема макулатуры и пластика',
              snippet:
              ['Центр по переработке отходов', '+77777072021', 'Ырысты 15 а, Алматы'].join(", "),
            )
        ),

        Marker(
            markerId: const MarkerId('marker3'),
            position: const LatLng(43.36833290321793, 76.93757297515965),
            draggable: true,
            onDragEnd: (value) {
              // value is the new position
            },
            infoWindow: InfoWindow(
              title: 'ТОО "Технология А"',
              snippet:
              ['Пункт приёма перерабатываемых отходов', '+77774975555', 'Алматы 050007'].join(', '),
            )
          // To do: custom marker icon
        ),

        Marker(
            markerId: const MarkerId('marker6'),
            position: const LatLng(37.415768808487435, -122.08440050482749),
            infoWindow: InfoWindow(
              title: 'ТОО "EcoLog Kazakhstan"',
              snippet:
              ['Центр по переработке отходов', '+77773333444', 'ул. Серикова 61, Алматы 050000'].join(', '),
            )
        ),
        Marker(
            markerId: const MarkerId('marker8'),
            position: const LatLng(43.20949468491954, 76.90803293181897),
            infoWindow: InfoWindow(
              title: 'Kazakhstan Waste Recycling',
              snippet:
              ['KWR', '+77272458143', 'ул. Исиналиева 2б, Алматы'].join(', '),
            )
        ),


      },
    );
  }

}


class k extends StatefulWidget {
  @override
  _kState createState() => _kState();
}

class _kState extends State<k> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class MyCamera extends StatefulWidget {
  @override
  _MyCameraState createState() => _MyCameraState();
}

class _MyCameraState extends State<MyCamera> {
  File? file;
  ImagePicker image = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sortAI"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 140,
              width: 180,
              color: Colors.black12,
              child: file == null
                  ? Icon(
                Icons.image,
                size: 50,
              )
                  : Image.file(
                file!,
                fit: BoxFit.fill,
              ),
            ),
            MaterialButton(
              onPressed: () {
                getgall();
              },
              color: Colors.blue[900],
              child: Text(
                "take from gallery",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                getcam();
              },
              color: Colors.blue[900],
              child: Text(
                "take from camera",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getcam() async {
    // ignore: deprecated_member_use
    var img = await image.getImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
  }

  getgall() async {
    // ignore: deprecated_member_use
    var img = await image.getImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }
}
class MyPlasticPage extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return Scaffold(
      appBar: AppBar(title: Text("sortAI"),),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){}, child: Text('Paper')),
            ElevatedButton(onPressed: (){}, child: Text('Paper')),
            ElevatedButton(onPressed: (){}, child: Text('Paper')),
            ElevatedButton(onPressed: (){}, child: Text('Paper')),
        ],
       ),
      ),
    );
  }
}
class MyPaperPage extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return Scaffold(
      appBar: AppBar(title: Text("sortAI"),),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){}, child: Text('Paper')),
            ElevatedButton(onPressed: (){}, child: Text('Paper')),
            ElevatedButton(onPressed: (){}, child: Text('Paper')),
            ElevatedButton(onPressed: (){}, child: Text('Paper')),
          ],
        ),
      ),
    );
  }
}
class MyGlassPage extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return Scaffold(
      appBar: AppBar(title: Text("sortAI"),),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){}, child: Text('Paper')),
            ElevatedButton(onPressed: (){}, child: Text('Paper')),
            ElevatedButton(onPressed: (){}, child: Text('Paper')),
            ElevatedButton(onPressed: (){}, child: Text('Paper')),
          ],
        ),
      ),
    );
  }
}
class MyEWastePage extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return Scaffold(
      appBar: AppBar(title: Text("sortAI"),),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){}, child: Text('Paper')),
            ElevatedButton(onPressed: (){}, child: Text('Paper')),
            ElevatedButton(onPressed: (){}, child: Text('Paper')),
            ElevatedButton(onPressed: (){}, child: Text('Paper')),
         ],
        ),
      ),
    );
  }
}
class MyMetalPage extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return Scaffold(
      appBar: AppBar(title: Text("sortAI"),),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){}, child: Text('Paper')),
            ElevatedButton(onPressed: (){}, child: Text('Paper')),
            ElevatedButton(onPressed: (){}, child: Text('Paper')),
            ElevatedButton(onPressed: (){}, child: Text('Paper')),


          ],
        ),
      ),
    );
  }
}
class MyMedicalPage extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return Scaffold(
      appBar: AppBar(title: Text("sortAI"),),
      body: Center(
        child: Text('')



      ),
    );
  }
}