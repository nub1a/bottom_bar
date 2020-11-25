import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MapPageState();
  }
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Map"),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: new FlutterMap(
        options: new MapOptions(
          center: new LatLng(48.494029, 35.184045),
          minZoom: 8.0,
        ),
        layers: [
          new TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
          new MarkerLayerOptions(markers: [
            new Marker(
                width: 45.0,
                height: 45.0,
                point: new LatLng(48.494029, 35.184045),
                builder: (context) => new Container(
                      child: IconButton(
                        icon: Icon(Icons.location_on),
                        color: Colors.red,
                        iconSize: 45.0,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapDetailScreen(),
                            ),
                          );
                        },
                      ),
                    ))
          ])
        ],
      ),
    );
  }
}

class MapDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text("Map Detail Screen"),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("Это мой дом =)"),
      ),
    );
  }
}
