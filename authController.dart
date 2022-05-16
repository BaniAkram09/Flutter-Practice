import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myapp1/model/user.dart';
import 'package:myapp1/service/auth.dart';
import 'package:myapp1/service/firestore_service.dart';
// import 'package:myapp1/service/storage_service.dart';
import 'package:password_strength/password_strength.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final FirestoreServices _auth = Get.find<FirestoreServices>();
  // final StorageServices _storage = Get.find<StorageServices>();
  final AuthService _authService = Get.find<AuthService>();

  login() async {
    if (emailController.text.isNotEmpty) {
      if (passController.text.isNotEmpty) {
        if (emailController.text.isEmail) {
          double strength = estimatePasswordStrength(passController.text);
          // ignore: avoid_print
          print(strength);
          if (strength > 0.3) {
            String error = await _authService.loginEmailPass(
                emailController.text, passController.text);
            // ignore: avoid_print
            print(error);
            if (error == null) {
            } else {
              String error =
                  await _auth.login(emailController.text, passController.text);
              if (error.isNotEmpty) {}
            }
//            Get.to('page');
          } else {}
        } else {}
      } else {}
    } else {}
    // } else {}
  }
}
