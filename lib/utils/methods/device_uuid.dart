import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

Future<String> getDeviceUUID() async {
       String deviceId = '';
       DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
       
       if (Platform.isAndroid) {
         AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
         deviceId = androidInfo.id; // Retrieve the Android device UUID
       } else if (Platform.isIOS) {
         IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
         deviceId = iosInfo.identifierForVendor!; // Retrieve the iOS device UUID
       }
       
       return deviceId;
     }