// import 'dart:collection';
//
// import 'package:dr_dent/Src/core/constants/color_constants.dart';
// import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
// import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:get/get.dart';
//
//
// class MapWidget extends StatefulWidget {
//   final double lat;
//   final double lon;
//   final Function? onSave;
//
//   MapWidget({this.lat = 30.0444, this.lon = 31.2357, this.onSave});
//
//   @override
//   _MapWidgetState createState() => _MapWidgetState();
// }
//
// class _MapWidgetState extends State<MapWidget> {
//   var myMarkers = HashSet<Marker>();
//   BitmapDescriptor? customMarker;
//   List<Polyline> myPolyLine = [];
//
//   double? latitude;
//   double? longitude;
//
//   getCustomMarker() async {
//     customMarker = await BitmapDescriptor.fromAssetImage(
//         ImageConfiguration.empty, "assets/icons/locationMarker.png");
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getCustomMarker();
//     // createPloyLine();
//     latitude = widget.lat;
//     longitude = widget.lon;
//   }
//
//   // createPloyLine() {
//   //   myPolyLine.add(
//   //     Polyline(
//   //         polylineId: PolylineId('1'),
//   //         color: ConstantColor.MAIN_Yellow,
//   //         width: 3,
//   //         points: [
//   //           LatLng(29.990000, 31.149000),
//   //           LatLng(29.999000, 31.149900),
//   //         ]),
//   //   );
//   // }
//   //
//   // Set<Polygon> myPolygon() {
//   //   var polygonCoords = List<LatLng>();
//   //   polygonCoords.add(LatLng(37.43296265331129, -122.08832357078792));
//   //   polygonCoords.add(LatLng(37.43006265331129, -122.08832357078792));
//   //   polygonCoords.add(LatLng(37.43006265331129, -122.08332357078792));
//   //   polygonCoords.add(LatLng(37.43296265331129, -122.08832357078792));
//   //
//   //   var polygonSet = Set<Polygon>();
//   //   polygonSet.add(
//   //     Polygon(
//   //       polygonId: PolygonId('1'),
//   //       points: polygonCoords,
//   //       strokeWidth: 2,
//   //       strokeColor: ConstantColor.MAIN_Dimer,
//   //     ),
//   //   );
//   //   return polygonSet;
//   // }
//
//   String? data;
//   GetStorage box = GetStorage();
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         GoogleMap(
//           mapType: MapType.normal,
//           initialCameraPosition: CameraPosition(
//             zoom: 16,
//             target: LatLng(widget.lat, widget.lon),
//           ),
//           onTap: (position) async {
//             setState(() {
//               myMarkers.clear();
//               myMarkers.add(
//                 Marker(
//                   markerId: MarkerId("1"),
//                   position: LatLng(position.latitude, position.longitude),
//                   infoWindow: InfoWindow(
//                       title: "Monrolegacy",
//                       snippet: "Please Select Your Location",
//                       onTap: () {
//                         print("aaaaaaaa");
//                       }),
//                   icon: customMarker!,
//                 ),
//               );
//               latitude = position.latitude;
//               longitude = position.longitude;
//              });
//             List<Placemark> placemarks = await placemarkFromCoordinates(
//                 latitude!, longitude!,
//                 localeIdentifier: "ar");
//             data = "${placemarks[0].country} - ${placemarks[0].administrativeArea} - ${placemarks[0].subAdministrativeArea} - ${placemarks[0].street} - ${placemarks[0].name}";
//           },
//           onMapCreated: (GoogleMapController googleMapController) {
//             setState(() {
//               myMarkers.add(
//                 Marker(
//                   markerId: MarkerId("1"),
//                   position: LatLng(widget.lat, widget.lon),
//                   infoWindow: InfoWindow(
//                       title: "Monrolegacy",
//                       snippet: "Please Select Your Location",
//                       onTap: () {
//                         print("aaaaaaaa");
//                       }),
//                   icon: customMarker!,
//                 ),
//               );
//
//             });
//           },
//           markers: myMarkers,
//           // polylines: myPolyLine.toSet(),
//           // polygons: myPolygon(),
//         ),
//         Padding(
//           padding: EdgeInsets.only(
//             top:28.h,
//             right:16.w,
//             left:16.w,
//           ),
//           child: Material(
//             child: Container(
//               alignment: Alignment.topCenter,
//               padding: EdgeInsets.only(
//                 top:16.h,
//                 bottom:16.h,
//               ),
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(
//                      6.r)),
//               height:48.h,
//               width: double.infinity,
//               child: Center(
//                 child: CustomText(
//                   text: "ابحث عن مكان او تحرك علي الخريطة",
//                   color: kCMainBlack,
//                   fontSize:14.w,
//                   fontW: FW.semibold,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Align(
//           alignment: Alignment.bottomCenter,
//           child: Material(
//             child: Container(
//               padding: EdgeInsets.symmetric(
//                 horizontal:16.w,
//                 vertical: 16.h,
//               ),
//               height: 180.h,
//               width: double.infinity,
//               color: Colors.white,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   CustomText(
//                     text: "العنوان",
//                     color: kCMainBlack,
//                     fontSize: 12.w,
//                     fontW: FW.semibold,
//
//                   ),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Icon(
//                         Icons.add_location_alt_outlined,
//                         color: kCMain,
//                         size: 16.w,
//                       ),
//                       SizedBox(
//                         width: 6.w,
//                       ),
//                       CustomText(
//                         text: "العنوان",
//                         color:kCMainBlack,
//                         fontSize: 16.w,
//                         fontW: FW.semibold,
//                       ), SizedBox(
//                         width: 16.w,
//                       ),
//                       Container(
//                         width: 260.w,
//                         child: CustomText(
//                           text: data ??"",
//                           color:kCMainBlack,
//                           fontSize: 16.w,
//                           maxLines: 2,
//                           overflow: true,                        fontW: FW.regular,
//
//                         ),
//                       ),
//                     ],
//                   ),
//                   ButtonDefault(
//                     title: 'save_contain'.tr,
//                     onTap: () {
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
