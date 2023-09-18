import 'dart:io';

import 'package:eco_project/chat-screen.dart';

import 'styles.dart';
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
      title: 'SortAI',
      theme: ThemeData(
          primarySwatch: Colors.green
      ),
      home: const MyHomePage(title: 'SortAI'),
      debugShowCheckedModeBanner: false,
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
        return Container(
          color: Colors.lightGreen.shade50,
          width: double.infinity,
          child: GridView.count(
            // crossAxisCount is the number of columns
            crossAxisCount: 2,
            childAspectRatio: (200 / 230),
            children: <Widget>[
              Container(

                margin: EdgeInsets.fromLTRB(8, 8, 0, 0),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: InkWell(
                    onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => MyPlasticPage()))},
                    child: Stack(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,  // add this
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(left: 12.0, top: 12.0),
                            child:
                            Text('Plastic',
                                style: const TextStyle(
                                  fontFamily: kButtonFont,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w600,
                                )
                            )),
                        Padding(
                            padding: const EdgeInsets.only(left: 50.0, top: 40.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                              child: Image.asset(
                                "assets/plastic-image.png",// width: 100,
                                height: 250,
                                width: 300,
                                // fit:BoxFit.fill

                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Container(

                margin: EdgeInsets.fromLTRB(0, 8, 8, 0),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: InkWell(
                    onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => MyPaperPage()))},
                    child: Stack(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,  // add this
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(left: 12.0, top: 12.0),
                            child:
                            Text('Paper',
                                style: const TextStyle(
                                  fontFamily: kButtonFont,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w600,
                                )
                            )),
                        Padding(
                            padding: const EdgeInsets.only(left: 50.0, top: 40.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                              child: Image.asset(
                                "assets/paper-image.png",// width: 100,
                                height: 300,
                                width: 300,
                                // fit:BoxFit.fill

                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Container(

                margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: InkWell(
                    onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => MyGlassPage()))},
                    child: Stack(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,  // add this
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(left: 12.0, top: 12.0),
                            child:
                            Text('Glass',
                                style: const TextStyle(
                                  fontFamily: kButtonFont,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w600,
                                )
                            )),
                        Padding(
                            padding: const EdgeInsets.only(left: 50.0, top: 40.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                              child: Image.asset(
                                "assets/glass-image.png",// width: 100,
                                height: 250,
                                width: 300,
                                // fit:BoxFit.fill

                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Container(

                margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: InkWell(
                    onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => MyEWastePage()))},
                    child: Stack(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,  // add this
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(left: 12.0, top: 12.0),
                            child:
                            Text('E-Waste',
                                style: const TextStyle(
                                  fontFamily: kButtonFont,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w600,
                                )
                            )),
                        Padding(
                            padding: const EdgeInsets.only(left: 90.0, top: 90.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                              child:Image.asset(
                                "assets/img/battery-image.png",// width: 100,
                                height: 120,
                                // width: 400,
                                // fit:BoxFit.fill

                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),

              Container(

                margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: InkWell(
                    onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => MyMedicalPage()))},
                    child: Stack(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,  // add this
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(left: 12.0, top: 12.0),
                            child:
                            Text('Medical Waste',
                                style: const TextStyle(
                                  fontFamily: kButtonFont,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600,
                                )
                            )),
                        Padding(
                            padding: const EdgeInsets.only(left: 50.0, top: 40.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                              child: Image.asset(
                                "assets/img/medical-image.png",// width: 100,
                                height: 250,
                                width: 300,
                                // fit:BoxFit.fill

                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Container(

                margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: InkWell(
                    onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => MyMetalPage()))},
                    child: Stack(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,  // add this
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(left: 12.0, top: 12.0),
                            child:
                            Text('Metal',
                                style: const TextStyle(
                                  fontFamily: kButtonFont,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w600,
                                )
                            )),
                        Padding(
                            padding: const EdgeInsets.only(left: 50.0, top: 40.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                              child: Image.asset(
                                "assets/img/metal.png",// width: 100,
                                height: 250,
                                width: 300,
                                // fit:BoxFit.fill

                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),

              Container(

                margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: InkWell(
                    onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => TetrapakPage()))},
                    child: Stack(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,  // add this
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(left: 12.0, top: 12.0),
                            child:
                            Text('TetraPak',
                                style: const TextStyle(
                                  fontFamily: kButtonFont,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w600,
                                )
                            )),
                        Padding(
                            padding: const EdgeInsets.only(left: 70.0, top: 50.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                              child: Image.asset(
                                "assets/img/materials/tetrapak.png",// width: 100,
                                height: 150,
                                width: 110,
                                // fit:BoxFit.fill

                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),

        );

      case 1:
        return MaterialApp(
          home: const MainApp(),
          debugShowCheckedModeBanner: false,
        );
      case 2:
        return MaterialApp(
          home: const Map(),
          debugShowCheckedModeBanner: false,
        );
      case 3:
        return MaterialApp(
          home: ChatScreen(),
          debugShowCheckedModeBanner: false,
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
            icon: Icon(Icons.dataset_outlined),
            label: 'Main',
            // Color: Colors.grey
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_rounded),
            label: 'Help',
            backgroundColor: Colors.white,
          ),
        ],
        iconSize: 36,
        // backgroundColor: Colors.white,
        selectedItemColor: Colors.green.shade800,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class Map extends StatelessWidget {
  const Map({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:  CustomMap(),
      debugShowCheckedModeBanner: false,
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

        Marker(
            markerId: const MarkerId('marker10'),
            position: const LatLng(43.25251949960636, 76.93275216809252),
            infoWindow: InfoWindow(
              title: 'Ассоциация "Kaz-Waste"',
              snippet:
              ['Ассоциация или организация', '+77272558778', 'пр-т. Сейфуллина 597, Алматы 050022'].join(', '),
            )
        ),

        Marker(
            markerId: const MarkerId('marker10'),
            position: const LatLng(43.25251949960636, 76.93275216809252),
            infoWindow: InfoWindow(
              title: 'Ecosen',
              snippet:
              ['Пункт приёма перерабатываемых отходов', '10:00-19:00', 'Розыбакиев көшесі 247/3, Алматы 050060'].join(', '),
            )
        ),


        Marker(
            markerId: const MarkerId('marker10'),
            position: const LatLng(42.31444798717531, 69.5596636515622),
            infoWindow: InfoWindow(
              title: 'ПРИЕМ МАКУЛАТУРЫ В ШЫМКЕНТЕ №1 | САМОВЫВОЗ |',
              snippet:
              ['Пункт приёма перерабатываемых отходов', '09:00–19:00', 'ул. Гагарина 112Б, Шымкент 160000'].join(', '),
            )
        ),

        Marker(
            markerId: const MarkerId('marker10'),
            position: const LatLng(42.31444798717531, 69.5596636515622),
            infoWindow: InfoWindow(
              title: 'Прием Макулатуры',
              snippet:
              ['Пункт приёма перерабатываемых отходов', '09:00–19:00', 'ул. Гагарина 112Б, Шымкент 160000'].join(', '),
            )
        ),

        Marker(
            markerId: const MarkerId('marker10'),
            position: const LatLng(51.16561886811891, 71.46865135199161),
            infoWindow: InfoWindow(
              title: 'Taza',
              snippet:
              ['Пункт приёма перерабатываемых отходов', '09:00–18:00', 'A 369, 10/4, Астана'].join(', '),
            )


        ),

        Marker(
            markerId: const MarkerId('marker10'),
            position: const LatLng(51.22284989303371, 71.39449364317097),
            infoWindow: InfoWindow(
              title: 'ПРИЕМ МАКУЛАТУРЫ В НУР-СУЛТАН',
              snippet:
              ['Пункт приёма перерабатываемых отходов', '+77029607755', 'ул. Өндіріс, 85/1, Астана 010000'].join(', '),
            )


        ),

        Marker(
            markerId: const MarkerId('marker10'),
            position: const LatLng(51.10011749163738, 71.41794572954088),
            infoWindow: InfoWindow(
              title: 'Taza Qala',
              snippet:
              ['Центр по переработке отходов', '+77019900694', 'пр-т. Мангилик Ел. 50, Астана 020000'].join(', '),
            )


        ),
      },
    );
  }}
class MyPlasticPage extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return Scaffold(
        appBar: AppBar(title: Text("SortAI"),),
        body: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  Stack(children: [Container(
                    height: 100,
                    width: 500,
                    margin: EdgeInsets.only(top: 0, left: 0, right: 0),
                    decoration: new BoxDecoration(
                      color: Color(0xfff1f1f1),

                    ),
                  ), Container(
                    height: 250,
                    width: 500,
                    margin: EdgeInsets.only(top: 0, left: 0, right: 0),
                    decoration: new BoxDecoration(
                      color: Color(0xfff1f1f1),
                      borderRadius: new BorderRadius.all(Radius.elliptical(100, 50)),
                    ),
                  ), Padding(padding: EdgeInsets.only(top: 20, left: 0, right: 0),
                      child:Align( alignment: Alignment.center,
                          child: Image.asset("assets/img/containers/black.png", height: 210, width: 210, )))]),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    // child: Image.asset("assets/photo_1.jpeg"),
                    child: Flexible(

                      child: Text(
                        "There are 7 types of plastic, some of them are recycled and reused, others are not, and it is important to distinguish them from each other by labeling them. Plastic products marked PET, PEHD(HDPE), LDPE, PP, PS are recyclable and can be recycled. But its important to pay attention to the trash can you throw in, as some only accept certain types of plastic. Plastic labeled PVC or OTHER is not recyclable due to its complex composition and harmful emissions during their disposal. They should be thrown into the general trash can.\nHow to properly dispose of plastic?\n"
                            "\n"
                            "1. Prepare waste before disposal: containers must be clean, dried, it is advisable to remove stickers, labels;\n\n"
                            "2. crumple plastic if possible;\n\n"
                            "3. put the caps in a separate bag, as the material from which they are made differs from the material of the bottle.\n\n",
                        style: const TextStyle(
                          fontFamily: kButtonFont,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),

                    ),

                  ),])));
    return Scaffold(
        appBar: AppBar(title: Text("SortAI"),),
        body: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    // child: Image.asset("assets/photo_1.jpeg"),
                    child: Flexible(

                      child: Text(
                        "There are 7 types of plastic, some of them are recycled and reused, others are not, and it is important to distinguish them from each other by labeling them. Plastic products marked PET, PEHD(HDPE), LDPE, PP, PS are recyclable and can be recycled. But its important to pay attention to the trash can you throw in, as some only accept certain types of plastic. Plastic labeled PVC or OTHER is not recyclable due to its complex composition and harmful emissions during their disposal. They should be thrown into the general trash can.\nHow to properly dispose of plastic?\n"
                            "\n"
                            "1. Prepare waste before disposal: containers must be clean, dried, it is advisable to remove stickers, labels;\n\n"
                            "2. crumple plastic if possible;\n\n"
                            "3. put the caps in a separate bag, as the material from which they are made differs from the material of the bottle.\n\n",
                        style: const TextStyle(
                          fontFamily: kButtonFont,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),

                    ),

                  ), Image.asset("assets/photo_1.jpeg"),])));
  }
}
class MyPaperPage extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return Scaffold(
        appBar: AppBar(title: Text("SortAI"),),
        body: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  Stack(children: [Container(
                    height: 100,
                    width: 500,
                    margin: EdgeInsets.only(top: 0, left: 0, right: 0),
                    decoration: new BoxDecoration(
                      color: Color(0xfff1f1f1),

                    ),
                  ), Container(
                    height: 250,
                    width: 500,
                    margin: EdgeInsets.only(top: 0, left: 0, right: 0),
                    decoration: new BoxDecoration(
                      color: Color(0xfff1f1f1),
                      borderRadius: new BorderRadius.all(Radius.elliptical(100, 50)),
                    ),
                  ), Padding(padding: EdgeInsets.only(top: 20, left: 0, right: 0),
                      child:Align( alignment: Alignment.center,
                          child: Image.asset("assets/img/containers/black.png", height: 210, width: 210, )))]),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    // child: Image.asset("assets/photo_1.jpeg"),
                    child: Flexible(

                      child: Text(
                    """ To ensure proper disposal, follow these recommendations:
                    
1) Separate paper from other types of waste, such as plastic, metal, glass, or organic materials.

2) Check if the paper is clean and dry. Do not throw away paper that is wet, dirty, stained, or contaminated with food or chemicals.

3) Flatten or fold the paper to reduce its volume and save space in the recycling bin.

4) If possible, use a shredder to cut the paper into small pieces, especially if it contains sensitive or personal information.

5) Place the paper in a designated recycling bin or bag. Make sure the bin or bag is clearly labeled as "paper" or "recycling".""",
                        style: const TextStyle(
                          fontFamily: kButtonFont,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),

                    ),

                  ),])));


  }
}
class MyGlassPage extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return Scaffold(
        appBar: AppBar(title: Text("SortAI"),),
        body: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  Stack(children: [Container(
                    height: 100,
                    width: 500,
                    margin: EdgeInsets.only(top: 0, left: 0, right: 0),
                    decoration: new BoxDecoration(
                      color: Color(0xfff1f1f1),

                    ),
                  ), Container(
                    height: 250,
                    width: 500,
                    margin: EdgeInsets.only(top: 0, left: 0, right: 0),
                    decoration: new BoxDecoration(
                      color: Color(0xfff1f1f1),
                      borderRadius: new BorderRadius.all(Radius.elliptical(100, 50)),
                    ),
                  ), Padding(padding: EdgeInsets.only(top: 20, left: 0, right: 0),
                      child:Align( alignment: Alignment.center,
                          child: Image.asset("assets/img/containers/black.png", height: 210, width: 210, )))]),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    // child: Image.asset("assets/photo_1.jpeg"),
                    child: Flexible(

                      child: Text(
                        "The following waste can be thrown into the glass container: glass bottles (for wine or juice), jars for jam or baby food, glass containers for medicines and cosmetics, glass bottles for perfumes. Thus, the following should not be thrown into the glass waste container: lead or crystal glass, light bulbs, window panes, mirror fragments, porcelain, ceramics, glass decorations such as Christmas balls. All this waste must be disposed of together with household waste or handed over to recycling centers.",
                        style: const TextStyle(
                          fontFamily: kButtonFont,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),

                    ),

                  ),])));
  }
}
class MyEWastePage extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return Scaffold(
        appBar: AppBar(title: Text("SortAI"),),
        body: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  Stack(children: [Container(
                    height: 100,
                    width: 500,
                    margin: EdgeInsets.only(top: 0, left: 0, right: 0),
                    decoration: new BoxDecoration(
                      color: Color(0xfff1f1f1),

                    ),
                  ), Container(
                    height: 250,
                    width: 500,
                    margin: EdgeInsets.only(top: 0, left: 0, right: 0),
                    decoration: new BoxDecoration(
                      color: Color(0xfff1f1f1),
                      borderRadius: new BorderRadius.all(Radius.elliptical(100, 50)),
                    ),
                  ), Padding(padding: EdgeInsets.only(top: 20, left: 0, right: 0),
                      child:Align( alignment: Alignment.center,
                          child: Image.asset("assets/img/containers/black.png", height: 210, width: 210, )))]),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    // child: Image.asset("assets/photo_1.jpeg"),
                    child: Flexible(

                      child: Text(
                        "1. Appliances:\n"
                            "  Household appliances cannot be thrown into a landfill due to their chemical composition, so household appliances must be recycled:\n"
                            " \n1 way: hand over household appliances  to the store;\n"
                            "2 way: hand over to the reception points  of your city;\n"
                            "3 way: call one of the recycling services  that will help you take the device out.\n"

                            "\n2. Communication and information technology devices:\n"
                            "These include cell phones; smartphones; desktop computers; computer monitors; laptops; hard disks. First of all, do not throw the device in the trash. Disposal methods:\n"
                            "\n1. Sell your old smartphone;\n"
                            "2. Hand over to the manufacturing company. Almost all modern electronics manufacturers offer recycling of goods and post information on their websites with the addresses of points for returning old equipment.\n"
                            "3. Recycling program from leading stores. Many electronics stores are introducing a recycling program for old electronics, where the customer is given a discount on new smartphone models in return. This allows you to save some money on the purchase of a new device and at the same time get rid of the old one in an environmentally friendly way.\n"
                            "Computers can be handed over to metal collection points; find specialized recycling companies that will take out and disassemble the PC; take advantage of recycling programs at home appliance stores. Hard drives are also recycled when they are returned to the store, or you can disassemble the drive and take it to a metal collection point.\n"


                            "3. Home Entertainment Devices:\n"
                            "This category includes the following electronic waste: DVD, Blu-Ray players; stereo; televisions; video game systems; faxes; copiers; printers. Old video cassettes and CDs can be handed over to electrical waste collection points and some separate waste collection points. An unwanted device can be taken to a recycling center, thrown into an electrical waste container, exchanged for a discount in a store, or taken to a workshop.\n"

                            "4. Electronic utilities:"
                            "Remove the built-in battery pack before disposing of the remote control. In every city there are electronic waste collection points where you can hand over unnecessary cables, wires, batteries. Charges take them to a special collection point for hazardous waste; take it to a store specializing in chargers and batteries. Incandescent light bulbs do not contain harmful substances and plastic, so they should be thrown into the general trash can, but they should not be thrown into the glass bin. Fluorescent lamps should not be thrown into the general trash can, but must be taken to a special recycling center, due to the content of mercury in the lamp. LED lamps can be thrown away with regular trash, but they contain metals and plastics that can be separated and sent for recycling.\n",
                        style: const TextStyle(
                          fontFamily: kButtonFont,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),

                    ),

                  ),])));
  }
}
class MyMetalPage extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return Scaffold(
        appBar: AppBar(title: Text("SortAI"),),
        body: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  Stack(children: [Container(
                    height: 100,
                    width: 500,
                    margin: EdgeInsets.only(top: 0, left: 0, right: 0),
                    decoration: new BoxDecoration(
                      color: Color(0xfff1f1f1),

                    ),
                  ), Container(
                    height: 250,
                    width: 500,
                    margin: EdgeInsets.only(top: 0, left: 0, right: 0),
                    decoration: new BoxDecoration(
                      color: Color(0xfff1f1f1),
                      borderRadius: new BorderRadius.all(Radius.elliptical(100, 50)),
                    ),
                  ), Padding(padding: EdgeInsets.only(top: 20, left: 0, right: 0),
                      child:Align( alignment: Alignment.center,
                          child: Image.asset("assets/img/containers/black.png", height: 210, width: 210, )))]),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    // child: Image.asset("assets/photo_1.jpeg"),
                    child: Flexible(

                      child: Text( "This type of garbage includes metal caps; \ncans and aluminum cans, foil. Before you get rid of them, rinse each jar. \nSqueeze aluminum cans as much as possible so that they take up as little space as possible. The condition of the scrap metal for release does not really matter - it is burnt, rusty.",
                        style: const TextStyle(
                          fontFamily: kButtonFont,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),

                    ),

                  ),])));
  }
}
class MyMedicalPage extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return Scaffold(
        appBar: AppBar(title: Text("SortAI"),),
        body: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  Stack(children: [Container(
                    height: 100,
                    width: 500,
                    margin: EdgeInsets.only(top: 0, left: 0, right: 0),
                    decoration: new BoxDecoration(
                      color: Color(0xfff1f1f1),

                    ),
                  ), Container(
                    height: 250,
                    width: 500,
                    margin: EdgeInsets.only(top: 0, left: 0, right: 0),
                    decoration: new BoxDecoration(
                      color: Color(0xfff1f1f1),
                      borderRadius: new BorderRadius.all(Radius.elliptical(100, 50)),
                    ),
                  ), Padding(padding: EdgeInsets.only(top: 20, left: 0, right: 0),
                      child:Align( alignment: Alignment.center,
                          child: Image.asset("assets/img/containers/black.png", height: 210, width: 210, )))]),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    // child: Image.asset("assets/photo_1.jpeg"),
                    child: Flexible(

                      child: Text("Medical syringes are objects with an approved hazard class. Self-disposal of the syringe is not possible, but there are practical ways to significantly reduce the harm caused:\n\n"
                          "1) After using it, you can not immediately throw it into the trash; \n"
                          "2) Separate the cap with the needle from the syringe;\n"
                          "3) Place the needle in special containers - they are made of puncture-resistant plastic with a tight-fitting lid. In the absence of such containers, you can use a suitable container for detergent or other household chemicals made of durable plastic. \n"
                          "4) When filling the container, you need to place it in the middle of the trash can. Never throw needles down the toilet. ",
                        style: const TextStyle(
                          fontFamily: kButtonFont,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),

                    ),

                  ),])));
  }
}


class TetrapakPage extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return Scaffold(
        appBar: AppBar(title: Text("SortAI"),),
        body: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  Stack(children: [Container(
                    height: 100,
                    width: 500,
                    margin: EdgeInsets.only(top: 0, left: 0, right: 0),
                    decoration: new BoxDecoration(
                      color: Color(0xfff1f1f1),

                    ),
                  ), Container(
                    height: 250,
                    width: 500,
                    margin: EdgeInsets.only(top: 0, left: 0, right: 0),
                    decoration: new BoxDecoration(
                      color: Color(0xfff1f1f1),
                      borderRadius: new BorderRadius.all(Radius.elliptical(100, 50)),
                    ),
                  ), Padding(padding: EdgeInsets.only(top: 20, left: 0, right: 0),
                      child:Align( alignment: Alignment.center,
                          child: Image.asset("assets/img/containers/black.png", height: 210, width: 210, )))]),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    // child: Image.asset("assets/photo_1.jpeg"),
                    child: Flexible(

                      child: Text("""Here are some recommendations on how to correctly throw away tetrapak:

- Check if your local recycling facility can process tetrapak (You can ask this in our ChatBot).

- If your area participates in tetrapak recycling, place the empty cartons in your regular recycling bin. Make sure to rinse the inside of the package and remove the plastic cap before disposing.

- If your area does not have a tetrapak recycling facility, you can ship your cartons to the Carton Council. Or waste it like a Cardboard.

- You can also contact your local Waste Management branch and Tetra Pak to request that your area be added to the recycling program.

- Alternatively, you can repurpose your tetrapak for various uses, such as planting seeds, storing craft supplies, or making food containers.""",
                        style: const TextStyle(
                          fontFamily: kButtonFont,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),

                    ),

                  ),])));

  }
}