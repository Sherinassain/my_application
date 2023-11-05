import 'package:get/get.dart';
import 'package:my_application/presentation/screens/forgot_password_screen/controller/forgot_password_controller.dart';

import 'package:my_application/presentation/screens/splash_screen/controller/splash_controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordController());
  }
}
