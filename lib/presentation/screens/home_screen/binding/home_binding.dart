import 'package:get/get.dart';
import 'package:my_application/presentation/screens/home_screen/controller/home_controller.dart';

import 'package:my_application/presentation/screens/splash_screen/controller/splash_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
