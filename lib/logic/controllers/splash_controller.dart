import 'package:get/get.dart';
import 'package:padilni/utils/request_status.dart';
 
class SplashController extends GetxController
{  
  @override
  void onInit() {
    onchangesplashstate();
    super.onInit();
  }
  var requeststatus = RequestStatus.begin.obs;

  setrequeststatus(RequestStatus status )=> requeststatus.value = status;

  onchangesplashstate() async
  {
     await Future.delayed(const Duration(seconds:4));

     Get.offAllNamed("/onboarding");


  }
 



     
  

}