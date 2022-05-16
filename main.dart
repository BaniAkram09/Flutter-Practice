import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp1/pages/login_ui.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myapp1/service/auth.dart';
import 'package:myapp1/service/firestore_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: BindingsBuilder(() {
          Get.lazyPut(() => FirestoreServices());
          Get.lazyPut(() => AuthService());
        }),
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.noTransition,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Login());
  }
}
