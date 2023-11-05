import 'package:get/get.dart';
import 'package:my_application/presentation/screens/home_screen/controller/home_controller.dart';

import 'package:my_application/presentation/screens/splash_screen/controller/splash_controller.dart';
import 'package:my_application/presentation/screens/user_registration_screen/controller/user_registration_controller.dart';

class UserRegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserRegistrationController());
  }
}
