import 'dart:async';

import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
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
    setState(() {
      isLoading = true;
    });
    await placemarkFromCoordinates(
            targetPosition!.latitude, targetPosition!.longitude,
            localeIdentifier: "ar")
        .then((value) {
      setState(() {
        var data = value.first;
        //  address = data.administrativeArea + data.locality + data.street;
        //  address = "${data.administrativeArea} - ${data.locality} - ${data.street} - ${data.name}";
        address =
            "${data.administrativeArea} - ${data.locality} - ${data.street}";
      });
      isLoading = false;
    });
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
    if (targetPosition != null) {
      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: targetPosition!,
        bearing: 90.0,
        tilt: 45.0,
        zoom: 14.4746,
      )));
    }

    setState(() {
      _markers.add(Marker(
        markerId: const MarkerId("my location"),
        position: targetPosition!,
        // icon: mapMarker!,
      ));
    });
  }

  static final CameraPosition _kGooglePlex =
      CameraPosition(target: targetPosition!, zoom: 14.4746, bearing: 2.0);

  void getMyLocation() async {
    await Geolocator.getCurrentPosition().then((value) {
      setState(() {
        targetPosition = LatLng(value.latitude, value.longitude);
      });
    }).then((value) => setAddress());
  }

  GetStorage box = GetStorage();

  @override
  void initState() {
    super.initState();
    if (widget.targetPosition != null) {
      targetPosition = widget.targetPosition;
    } else {
      getMyLocation();
    }
    setAddress();
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
                                  text: 'التوصيل الي',
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
                                debugPrint('targetPosition!.latitude ${targetPosition!.latitude}');
                                debugPrint('targetPosition!.longitude ${targetPosition!.longitude}');
                                debugPrint('address! ${address!}');
                                if (widget.onSave != null) {
                                  debugPrint('this is my location');
                                  widget.onSave!(targetPosition!.latitude,
                                      targetPosition!.longitude, address!);
                                }
                              },
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
