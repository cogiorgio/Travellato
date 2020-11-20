import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:myapp/screen/homepage/post.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        children: [
          MapPreview(),
          Feed(),
        ],
      ),
    );
  }
}

class MapPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MapTitle(),
        MapClip(),
      ],
    );
  }
}

class MapTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Row(
        children: [
          Icon(
            Icons.map,
            color: Colors.black,
          ),
          Text(
            "Explore",
            style: TextStyle(fontSize: 25),
          ),
        ],
      ),
    );
  }
}

class MapClip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        width: 400,
        height: 200,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: MyMap(),
        ),
      ),
    );
  }
}

class MyMap extends StatefulWidget {
  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  final Map<String, Marker> _markers = {};

  // Future<Uint8List> getBytesFromAsset(String path, int width) async {
  //   ByteData data = await rootBundle.load(path);
  //   ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
  //       targetWidth: width);
  //   ui.FrameInfo fi = await codec.getNextFrame();
  //   return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
  //       .buffer
  //       .asUint8List();
  // }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    // final _googleOffices = await locations.getGoogleOffices();
    // final icon = await getBytesFromAsset('assets/marker.png', 100);
    // setState(() {
    //   _markers.clear();
    //   for (final office in _googleOffices.offices) {
    //     final marker = Marker(
    //         markerId: MarkerId(office.name),
    //         position: LatLng(office.lat, office.lng),
    //         icon: BitmapDescriptor.fromBytes(icon),
    //         infoWindow: InfoWindow(
    //           title: office.name,
    //           snippet: office.address,
    //         ));
    //     _markers[office.name] = marker;
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        onTap: (argument) => Navigator.pushNamed(context, '/map'),
        zoomControlsEnabled: false,
        zoomGesturesEnabled: false,
        liteModeEnabled: true,
        buildingsEnabled: true,
        mapToolbarEnabled: false,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: const LatLng(0, 0),
          zoom: 2.0,
        ),
        markers: _markers.values.toSet(),
      ),
    );
  }
}

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "3h ago",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
          Post(),
        ],
      ),
    );
  }
}
