// import 'dart:io';
//
//
// import 'package:geolocator/geolocator.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:google_api_availability/google_api_availability.dart';
// import 'package:location/location.dart' as loc;
//
//
//
// enum LocationRefusedReason{
//   permissionDenied,
//   permissionDeniedForEver,
//   locationOff,
//   unKnown
// }
//
// class LocationResponse{
//   final bool status;
//   final Position? position;
//   final LocationRefusedReason? reason;
//   LocationResponse({this.status=false, this.position,this.reason});
// }
//
// class GeolocationServices{
//
//   GetStorage box = GetStorage();
//   Future<LocationResponse>? determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     GooglePlayServicesAvailability availability;
//     if(Platform.isAndroid){
//       availability = await GoogleApiAvailability.instance.checkGooglePlayServicesAvailability();
//       box.write("google_available",(availability.value==0));
//     }else{
//       box.write("google_available",true);
//     }
//
//     print("value : ${box.read("google_available")}");
//
//     // if(box.read("google_available")){
//       print("step1");
//       serviceEnabled = await Geolocator.isLocationServiceEnabled();
//       if (!serviceEnabled) {
//         print("step2");
//         // _checkGps();
//         // return LocationResponse(status: false,reason: LocationRefusedReason.locationOff);
//         permission = await Geolocator.checkPermission();
//       }
//
//       permission = await Geolocator.checkPermission();
//       print("step3");
//       if (permission == LocationPermission.denied) {
//         print("step4");
//         permission = await Geolocator.requestPermission();
//         if (permission == LocationPermission.denied) {
//           print("step5");
//           return LocationResponse(status: false,reason: LocationRefusedReason.permissionDenied);
//           // permission = await Geolocator.checkPermission();
//         }
//       }
//
//       if (permission == LocationPermission.deniedForever) {
//         print("step6");
//         // Permissions are denied forever, handle appropriately.
//         return LocationResponse(status: false,reason: LocationRefusedReason.permissionDeniedForEver);
//         // permission = await Geolocator.checkPermission();
//       }
//       print("step7");
//       // When we reach here, permissions are granted and we can
//       // continue accessing the position of the device.
//       try{
//         var data = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//         return LocationResponse(status: true,position: data);
//       }catch(e){
//         print("an error occur in location $e");
//         return LocationResponse(status: false,reason: LocationRefusedReason.unKnown);
//       }
//     //
//     // }else{
//     //   return null!;
//     // }
//   }
//
//
//
//   loc.Location location = loc.Location();//explicit reference to the Location class
//   Future _checkGps() async {
//     if (!await location.serviceEnabled()) {
//       location.requestService();
//     }
//   }
//
//
// }