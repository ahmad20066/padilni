import 'package:get/get.dart';
import 'package:padilni/presentation/auth/verification/logic/verification_controller.dart';

class VerificationBinding extends Bindings {
  @override
  void dependencies() { 
    Get.lazyPut(() => VerifacationController());
  }

}