import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'app.dart';

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
                ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MyPaperPage()));}, child: Text('Paper')
                ),
                ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MyGlassPage()));}, child: Text('Glass')
                ),
                ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MyEWastePage()));}, child: Text('E-Waste')
                ),
                ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MyMetalPage()));}, child: Text('Metal')
                ),
                ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MyMedicalPage()));}, child: Text('Medical Waste')
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
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MainApp()));},
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
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Map()));},
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

class MyPlasticPage extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return Scaffold(
      appBar: AppBar(title: Text("sortAI"),),
      body: Center(
          child: Text("There are seven types of plastic, some of them are recycled and reused, others are not, and it is important to distinguish them from each other by labeling them. Plastic products marked PET, PEHD(HDPE), LDPE, PP, PS are recyclable and can be recycled. But its important to pay attention to the trash can you throw in, as some only accept certain types of plastic. Plastic labeled PVC or OTHER is not recyclable due to its complex composition and harmful emissions during their disposal. They should be thrown into the general trash can. How to properly dispose of plastic?"
              "1. Prepare waste before disposal: containers must be clean, dried, it is advisable to remove stickers, labels;"
              "2. crumple plastic if possible;"
              "3. put the caps in a separate bag, as the material from which they are made differs from the material of the bottle.")
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
        child: Text("1. Tetra Pak: Tetra Pak does not belong to waste paper, therefore, waste paper cannot be thrown into the waste bin. It should be disposed of in a plastic/Tetra Pak container or in a general recycling bin."
          "2. Paper cup. Does not apply to waste paper. Not subject to processing. Replace disposable paper cups with a thermal mug, take care of the environment."
          "Notepads, notebooks, newspapers, magazines, documents, cardboard, colored paper, postcards, calendars, sketchbooks can be thrown into the paper container. But it is important - remove paper clips, staples, springs and adhesive inserts from them.")

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
        child: Text(
            "The following waste can be thrown into the glass container: glass bottles (for wine or juice), jars for jam or baby food, glass containers for medicines and cosmetics, glass bottles for perfumes. Thus, the following should not be thrown into the glass waste container: lead or crystal glass, light bulbs, window panes, mirror fragments, porcelain, ceramics, glass decorations such as Christmas balls. All this waste must be disposed of together with household waste or handed over to recycling centers."
        )
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
        child: Text(
          "  1. Appliances:"
         "   Household appliances cannot be thrown into a landfill due to their chemical composition, so household appliances must be recycled:"
        "1 way: hand over household appliances to the store;"
        "2 way: hand over to the reception points of your city;"
        "3 way: call one of the recycling services that will help you take the device out."

        "2. Communication and information technology devices:"
        "These include cell phones; smartphones; desktop computers; computer monitors; laptops; hard disks. First of all, do not throw the device in the trash. Disposal methods:"
        "1. Sell your old smartphone;"
        "2. Hand over to the manufacturing company. Almost all modern electronics manufacturers offer recycling of goods and post information on their websites with the addresses of points for returning old equipment."
        "3. Recycling program from leading stores. Many electronics stores are introducing a recycling program for old electronics, where the customer is given a discount on new smartphone models in return. This allows you to save some money on the purchase of a new device and at the same time get rid of the old one in an environmentally friendly way."
        "Computers can be handed over to metal collection points; find specialized recycling companies that will take out and disassemble the PC; take advantage of recycling programs at home appliance stores. Hard drives are also recycled when they are returned to the store, or you can disassemble the drive and take it to a metal collection point."


        "3. Home Entertainment Devices:"
        "This category includes the following electronic waste: DVD, Blu-Ray players; stereo; televisions; video game systems; faxes; copiers; printers. Old video cassettes and CDs can be handed over to electrical waste collection points and some separate waste collection points. An unwanted device can be taken to a recycling center, thrown into an electrical waste container, exchanged for a discount in a store, or taken to a workshop."

        "4. Electronic utilities:"
        "Remove the built-in battery pack before disposing of the remote control. In every city there are electronic waste collection points where you can hand over unnecessary cables, wires, batteries. Charges take them to a special collection point for hazardous waste; take it to a store specializing in chargers and batteries. Incandescent light bulbs do not contain harmful substances and plastic, so they should be thrown into the general trash can, but they should not be thrown into the glass bin. Fluorescent lamps should not be thrown into the general trash can, but must be taken to a special recycling center, due to the content of mercury in the lamp. LED lamps can be thrown away with regular trash, but they contain metals and plastics that can be separated and sent for recycling."
        )
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
        child: Text( "This type of garbage includes metal caps; cans and aluminum cans, foil. Before you get rid of them, rinse each jar. Squeeze aluminum cans as much as possible so that they take up as little space as possible. The condition of the scrap metal for release does not really matter - it is burnt, rusty."





        ),
    )
    );
  }
}
class MyMedicalPage extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return Scaffold(
      appBar: AppBar(title: Text("sortAI"),),
      body: Center(
        child: Text("There are seven types of plastic, some of them are recycled and reused, others are not, and it is important to distinguish them from each other by labeling them. Plastic products marked PET, PEHD(HDPE), LDPE, PP, PS are recyclable and can be recycled. But its important to pay attention to the trash can you throw in, as some only accept certain types of plastic. Plastic labeled PVC or OTHER is not recyclable due to its complex composition and harmful emissions during their disposal. They should be thrown into the general trash can. How to properly dispose of plastic?"
    "1. Prepare waste before disposal: containers must be clean, dried, it is advisable to remove stickers, labels;"
    "2. crumple plastic if possible;"
    "3. put the caps in a separate bag, as the material from which they are made differs from the material of the bottle.")



      ),
    );
  }
}