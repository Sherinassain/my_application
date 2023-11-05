import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_application/core/common/scale.dart';
import 'package:my_application/core/constants/color.dart';
import 'package:my_application/core/utiles/app_utils.dart';
import 'package:my_application/presentation/screens/forgot_password_screen/service/forgot_password_screen_service.dart';
import 'package:my_application/presentation/screens/network_error_screen/network_error_screen.dart';
import 'package:my_application/repository/api/api_response.dart';
import 'package:my_application/routes/index.dart';

class ForgotPasswordController extends GetxController {
  var isLoading = false.obs;

  TextEditingController emailorPhoneNumberController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  GlobalKey<FormState> emailorPhoneNumberFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> PasswordFormKey = GlobalKey<FormState>();
  Future<bool> forgotPassword(
      {required String emailorPhone, required String password}) async {
    isLoading.value = true;
    final APIResponse parsedResData = await ForgotPasswordService()
        .forgotPassword(emailorPhone: emailorPhone, password: password);
    if (parsedResData.error != true) {
      AppUtils.oneTimeSnackBar('Password updated', bgColor: ColorConst.green3D);
      isLoading.value = false;

      return true;
    } else {
      isLoading.value = false;
      return false;
    }
  }
}
