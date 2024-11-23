import 'package:demo_flutter/router/mobile_router.dart';
import 'package:demo_flutter/router/project_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

   // this is for website build
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: ProjectRouter.LOGIN_SCREEN,
      getPages: ProjectRouter.routers,

    );

    // //this is mobile build
    // return GetMaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   debugShowCheckedModeBanner: false,
    //   initialRoute: MobileRouter.LOGIN_SCREEN,
    //   getPages: MobileRouter.routers,
    //
    // );
  }
}


