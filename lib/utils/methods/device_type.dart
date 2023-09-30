import 'dart:io';

String deviceTypeSelected()
{
  if(Platform.isAndroid) {
    return 'android';
  } else {
    return 'ios';
  }

}