
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  final LatLng coordinates;

  MapWidget({required this.coordinates});


  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  GoogleMapController? _controller ;
  Set<Marker> markers = {};
  @override
  void initState() {
    super.initState();
    if(widget.coordinates !=null){
      setState(() {
        markers.add(Marker(markerId: MarkerId('1'),position: widget.coordinates));
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return
      GoogleMap(
        mapType: MapType.normal,
        markers: markers,
        initialCameraPosition: CameraPosition(
          target: widget.coordinates,
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {
          // _controller.complete(controller);
          _controller = controller;
          if(widget.coordinates!=null){
            _controller!.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: widget.coordinates,
                  bearing: 90.0,
                  tilt: 45.0,
                  zoom: 14.4746,
                ),
              ),
            );
          }
        },
      );
  }
}