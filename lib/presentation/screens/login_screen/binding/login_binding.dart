import 'package:get/get.dart';
import 'package:my_application/presentation/screens/login_screen/controller/login_controller.dart';


class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
