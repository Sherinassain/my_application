import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_application/core/config/session.dart';
import 'package:my_application/core/exports/config.dart';
import 'package:my_application/presentation/screens/login_screen/service/login_screen_service.dart';
import 'package:my_application/presentation/screens/login_screen/service/res_model/login_res_model.dart';
import 'package:my_application/repository/api/api_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final storage = GetStorage();

  var isLoading = false.obs;
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  Future<bool> login(String email, String password) async {
    isLoading.value = true;
    final APIResponse<LoginResData> parsedResData =
        await LoginService().login(email: email, password: password);
    if (parsedResData.error != true) {
      ///save auth token todo:;
      setPreferenceToTrue();
      print('Id : ${parsedResData.data.id}');
      await storage.write(Session.id, parsedResData.data.id ?? '');

      storage.write(Session.isLogin, true);

      isLoading.value = false;

      // biggestDealBrandList=parsedResData.data.results;
      return true;
    } else {
      isLoading.value = false;
      return false;
    }
  }

  void setPreferenceToTrue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('myBooleanPreference', true);
  }
}
