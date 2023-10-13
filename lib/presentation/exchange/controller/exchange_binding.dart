import 'package:get/get.dart';
import 'package:padilni/presentation/exchange/controller/exchange_controller.dart';

class ExchangeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExchangeController());
  }


}