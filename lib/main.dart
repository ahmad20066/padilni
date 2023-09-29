import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/data/remote/diohelper.dart';
import 'package:padilni/presentation/splashscreen/splash_screen.dart';
import 'package:padilni/utils/local/shared.dart';
import 'package:padilni/utils/routes/app_routes.dart';
import 'package:padilni/utils/themes.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Shared.init();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: theme,
        getPages: AppRoutes.appRoutes,
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}
