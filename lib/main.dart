import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'eCure Application',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: Color.fromARGB(255, 216, 216, 223),
        textTheme: Theme.of(context).textTheme.apply(displayColor: Color(2)),
      ),
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();

  List<Marker> _markers = [
    Marker(
      markerId: MarkerId('marker_1'),
      position: LatLng(37.4219999, -122.0840575),
      infoWindow: InfoWindow(title: 'Hospital A'),
    ),
    Marker(
      markerId: MarkerId('marker_2'),
      position: LatLng(37.4369999, -122.0830575),
      infoWindow: InfoWindow(title: 'Hospital B'),
    ),
    Marker(
      markerId: MarkerId('marker_3'),
      position: LatLng(37.4269999, -122.0740575),
      infoWindow: InfoWindow(title: 'Hospital C'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find a Hospital'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by hospital or doctor name',
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
              ),
            ),
          ),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(37.4219999, -122.0840575),
                zoom: 12,
              ),
              markers: Set.from(_markers),
            ),
          ),
        ],
      ),
    );
  }
}
