import 'package:get/get.dart';

class LoginController extends GetxController
{

RxBool rememberMePressed = false.obs; 

onRemebermePressed()
{  

rememberMePressed.value = !rememberMePressed.value;

} 




}