


import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/screens/verfication_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneVerifyController{
  static Future<bool?>? verifyPhone({String? phone, Function? onSuccess}) async {
    var _auth = FirebaseAuth.instance;
    setLoading();
    _auth.verifyPhoneNumber(
        phoneNumber: phone!.startsWith("0")?"+2$phone":"+20$phone",
        // phoneNumber: "+201212648022",
        timeout: Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          onSuccess!();
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            debugPrint('The provided phone number is not valid.');
          }
         // if(e != null){
         //   if(e.toString().contains("The SMS verification code used to create the phone auth credential is invalid")){
         //   snackBarDefault(errorMessage: true,title: 'تاكد من كتابة الكوة الصحيح');
         //   }
         // }
          // Handle other errors
        },
        codeSent: (String verificationId, int? resendToken) {
          Get.back(); // to remove loading when code sent
          debugPrint("code sent");
          Get.offAll(()=>VerficationScreen(
            phone: phone,
            validationCode: verificationId,
            onSuccess: (String validationCode, String code) async {
              setLoading();
              AuthCredential credential = PhoneAuthProvider.credential(verificationId: validationCode, smsCode: code);
              UserCredential result = await _auth.signInWithCredential(credential);
              var user = result.user;
              Get.back();
              if (user != null){
                debugPrint("success verfication");
                onSuccess!();
              } else {
                debugPrint("an error occur");
              }
            },
          ));

        },
        codeAutoRetrievalTimeout: (data) {});
  }
}
