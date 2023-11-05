
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:my_application/core/constants/color.dart';
import 'package:my_application/core/utiles/app_utils.dart';
import 'package:my_application/presentation/screens/splash_screen/splash_screen.dart';

class NetworkErrorController extends GetxController {
  final storage = GetStorage();

  @override
  void onInit() async {
    super.onInit();
  }

  //if network error then go to network error screen else goto splash screen
  checkNetwork() async {
    if (await AppUtils.isOnline()) {
      Get.offAll(SplashScreen());
    } else {
      AppUtils.oneTimeSnackBar('No internet connection!',
          bgColor: ColorConst.green3D);
    }
  }
}
