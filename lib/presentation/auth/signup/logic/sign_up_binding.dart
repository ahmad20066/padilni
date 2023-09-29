import 'package:get/get.dart';
import 'package:padilni/presentation/auth/signup/logic/sign_up_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() { 
    Get.lazyPut(() => SignUpController());
  }

}