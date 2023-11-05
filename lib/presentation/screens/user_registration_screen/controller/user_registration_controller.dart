import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_application/presentation/screens/login_screen/service/login_screen_service.dart';
import 'package:my_application/presentation/screens/login_screen/service/res_model/login_res_model.dart';
import 'package:my_application/presentation/screens/user_registration_screen/service/user_registration_service.dart';
import 'package:my_application/repository/api/api_response.dart';

class UserRegistrationController extends GetxController{
  var isLoading = false.obs;
 TextEditingController emailorPhoneNumberController =
      TextEditingController();
  TextEditingController PasswordController =
      TextEditingController();
       TextEditingController firstNameController =
      TextEditingController();
  TextEditingController lastNameController =
      TextEditingController();
      GlobalKey<FormState> emailorPhoneNumberFormKey = GlobalKey<FormState>();
      GlobalKey<FormState> PasswordFormKey = GlobalKey<FormState>();
      GlobalKey<FormState> firstNameFormKey = GlobalKey<FormState>();
      GlobalKey<FormState> lastNameFormKey = GlobalKey<FormState>();
             Future<bool> userRegistration({required String firstName,
      required String lastName,
      required String emailorPhone,
      required String password}) async {
    isLoading.value = true;
    final APIResponse<LoginResData> parsedResData =
        await UserRegistrationService().userRegistration(firstName: firstName, lastName: lastName, emailorPhone: emailorPhone, password: password);
    if (parsedResData.error != true) {
   

      isLoading.value = false;

      return true;
    } else {
      isLoading.value = false;
      return false;
    }
  }
}