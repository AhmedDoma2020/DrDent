import 'dart:async';

import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '/src/core/utils/extensions.dart';

class MapScreen extends StatefulWidget {
  final Function(double, double, String)? onSave;
  final LatLng? targetPosition;

  MapScreen({this.onSave, this.targetPosition});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static LatLng? targetPosition = LatLng(31.037933, 31.381523);
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};
  BitmapDescriptor? mapMarker;
  bool isMove = false;
  bool isLoading = true;

  String? address = ' ';

  void setAddress() async {
    debugPrint("enter setAddress 1");
    setState(() {
      isLoading = true;
    });
    debugPrint("enter setAddress 2");
    if(widget.targetPosition!=null){
      await placemarkFromCoordinates(widget.targetPosition!.latitude, widget.targetPosition!.longitude, localeIdentifier: "ar")
          .then((value) {
        debugPrint("enter setAddress 3");
        setState(() {
          var data = value.first;
          //  address = data.administrativeArea + data.locality + data.street;
          //  address = "${data.administrativeArea} - ${data.locality} - ${data.street} - ${data.name}";
          address = "${data.administrativeArea} - ${data.locality} - ${data.street}";
          debugPrint("enter setAddress 4");
        });
        isLoading = false;
        debugPrint("enter setAddress 5");
      });
      debugPrint("enter setAddress 6");
    }else{
      await placemarkFromCoordinates(targetPosition!.latitude, targetPosition!.longitude, localeIdentifier: "ar")
          .then((value) {
        debugPrint("enter setAddress 3");
        setState(() {
          var data = value.first;
          //  address = data.administrativeArea + data.locality + data.street;
          //  address = "${data.administrativeArea} - ${data.locality} - ${data.street} - ${data.name}";
          address = "${data.administrativeArea} - ${data.locality} - ${data.street}";
          debugPrint("enter setAddress 4");
        });
        isLoading = false;
        debugPrint("enter setAddress 5");
      });
      debugPrint("enter setAddress 6");
    }

  }

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "assets/icons/map.png");
  }

  // Set<Circle> circles = Set.from([Circle(
  //   circleId: CircleId(id),
  //   center: LatLng(latitude, longitude),
  //   radius: 4000,
  // )]);

  void _onMapCreated(GoogleMapController controller) {
    if (widget.targetPosition != null) {
      debugPrint("enter 1");
      if (targetPosition != null) {
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: widget.targetPosition!,
              bearing: 90.0,
              tilt: 45.0,
              zoom: 14.4746,
            ),
          ),
        );
      }
      setState(() {
        _markers.add(Marker(
          markerId: const MarkerId("my location"),
          position: widget.targetPosition!,
          // icon: mapMarker!,
        ));
      });
      setAddress();
    } else {
      debugPrint("enter 2");
      setLoading();
      getLocation().then((value) {
        Get.back();
        if (targetPosition != null) {
          controller.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: targetPosition!,
                bearing: 90.0,
                tilt: 45.0,
                zoom: 14.4746,
              ),
            ),
          );
        }
        setState(() {
          _markers.add(Marker(
            markerId: const MarkerId("my location"),
            position: targetPosition!,
            // icon: mapMarker!,
          ));
        });
      });
    }
  }

  static final CameraPosition _kGooglePlex =
      CameraPosition(target: targetPosition!, zoom: 14.4746, bearing: 2.0);

  // void getMyLocation() async {
  //   debugPrint("enter in getMyLocation");
  //   await Geolocator.getCurrentPosition().then((value)async {
  //     debugPrint("enter in getMyLocation 1");
  //     setState(() {
  //       debugPrint("targetPosition = null then enter getMyLocation $targetPosition");
  //       targetPosition = LatLng(value.latitude, value.longitude);
  //       debugPrint("targetPosition = null then get getMyLocation $targetPosition");
  //     });
  //     debugPrint("enter in getMyLocation 2");
  //   }).then((value) => setAddress());
  //
  // }

  Future<void> getLocation() async {
    debugPrint("enter in getMyLocation");
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      debugPrint("enter in getMyLocation 1");
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      debugPrint("enter in getMyLocation 2");

      permission = await Geolocator.requestPermission();
      debugPrint("enter in getMyLocation 3");
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        debugPrint("enter in getMyLocation 4");
        return Future.error('Location permissions are denied');
      }
      debugPrint("enter in getMyLocation 5");
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      debugPrint("enter in getMyLocation 6");

      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((value) async {
      debugPrint("enter in getMyLocation 7");
      print("position is 1 $value");
      setState(() {
        debugPrint("enter in getMyLocation 8");
        debugPrint(
            "targetPosition = null then enter getMyLocation $targetPosition");
        targetPosition = LatLng(value.latitude, value.longitude);
        debugPrint(
            "targetPosition = null then get getMyLocation $targetPosition");
        debugPrint("enter in getMyLocation 9");
      });
      debugPrint("enter in getMyLocation 10");
      print("position is 2 $value");
    }).then((value) => setAddress());
    debugPrint("enter in getMyLocation 11");
  }

  GetStorage box = GetStorage();

  @override
  void initState() {
    super.initState();
    // if (widget.targetPosition != null) {
    //   debugPrint("targetPosition != null $targetPosition");
    //   targetPosition = widget.targetPosition;
    // } else {
    //   debugPrint("targetPosition = null $targetPosition");
    //   getLocation();
    // }
    // setAddress();
    // setState(() {
    //   if(widget.targetPosition==null){
    //     getMyLocation();
    //   }
    //   targetPosition = widget.targetPosition;
    // });
    // getMyLocation();
    // setAddress();
    // setCustomMarker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              GoogleMap(
                myLocationButtonEnabled: false,
                myLocationEnabled: true,
                buildingsEnabled: false,
                // padding: EdgeInsets.only(top: 300.h),
                rotateGesturesEnabled: true,
                mapType: MapType.normal,
                scrollGesturesEnabled: true,
                // zoomGesturesEnabled: true,
                // zoomControlsEnabled: true,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: _onMapCreated,
                markers: _markers,
                onTap: (LatLng pos) {
                  setState(() {
                    targetPosition = pos;
                    _markers.clear();
                    _markers.add(Marker(
                      markerId: const MarkerId("my location"),
                      position: targetPosition!,
                      // icon: mapMarker!,
                      // icon: mapMarker!,
                    ));
                  });
                  setAddress();
                },
                // onCameraMove: (CameraPosition position){
                //   setState(() {
                //     targetPosition = position.target;
                //   });
                //   //  setAddress();
                // },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 150.h,
                    width: 343.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19.r),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              CustomText(
                                text: 'Delivery_to',
                                color: kCBlackTitle,
                                fontW: FW.regular,
                                fontSize: 12.8,
                              ),
                            ],
                          ),
                          5.0.ESH(),
                          SizedBox(
                            width: 320.w,
                            child: CustomText(
                              text: isLoading ? '....' : address,
                              // text:'ahmedfathydfsgjfslklgkjdfjgdkjlfjklf.kgjkldfjgkdfjlglkjlkjfdlkj ',
                              color: kCBlackTitle,
                              fontW: FW.bold,
                              fontSize: 16,
                              overflow: true,
                            ),
                          ),
                          5.0.ESH(),
                          ButtonDefault(
                            active: targetPosition != null,
                            title: 'save_contain'.tr,
                            onTap: () {
                              debugPrint(
                                  'targetPosition!.latitude ${targetPosition!.latitude}');
                              debugPrint(
                                  'targetPosition!.longitude ${targetPosition!.longitude}');
                              debugPrint('address on map is ${address!}');
                              if (widget.onSave != null) {
                                debugPrint('this is my location');
                                debugPrint('address on map is ${address!}');
                                widget.onSave!(targetPosition!.latitude,
                                    targetPosition!.longitude, address!);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
