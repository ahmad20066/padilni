import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/data/remote/diohelper.dart';
import 'package:padilni/presentation/auth/login/login_page.dart';
import 'package:padilni/presentation/auth/signup/sign_up_page.dart';
import 'package:padilni/presentation/exchange/screen/exchange_screen.dart';
import 'package:padilni/presentation/main_screen/screen/main_screen.dart';
import 'package:padilni/presentation/splashscreen/splash_screen.dart';
import 'package:padilni/services/notification_config.dart';
import 'package:padilni/utils/lang/translations.dart';
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
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await DioHelper.init();
  NotificationConfig config = NotificationConfig();
  await Shared.init();

  await config.initNotification();
  if (Shared.getstring("uuid") == null) {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      Shared.setstring("uuid", androidInfo.id);
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      Shared.setstring("uuid", iosInfo.identifierForVendor!);
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(420, 1000),
      child: GetMaterialApp(
          theme: gettheme(context),
          getPages: AppRoutes.appRoutes,
          // translations: Translation(),
          // locale: Shared.getstring("lang") != null
          //     ? Locale(Shared.getstring("lang")!)
          //     : Get.deviceLocale,
          fallbackLocale: const Locale('ar'),
          debugShowCheckedModeBanner: false,
          home: SplashScreen()),
    );
  }
}
