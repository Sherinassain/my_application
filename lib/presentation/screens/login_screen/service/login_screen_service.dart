
import 'package:my_application/core/constants/color.dart';
import 'package:my_application/core/utiles/app_utils.dart';
import 'package:my_application/presentation/screens/login_screen/service/res_model/login_res_model.dart';
import 'package:my_application/repository/api/api_helper.dart';
import 'package:my_application/repository/api/api_response.dart';

class LoginService {
  Future<APIResponse<LoginResData>> login(
      {required String email, required String password}) async {
    final body = {
    "emailorphonenumber" : email,
    "password": password
};
    try {
      final APIResponse response = await APIHelper.postData(
          endPoint: '/login',
          header: APIHelper.getApiHeader(),
          body: body);
      if (response.error == true) {
        return APIResponse(data: LoginResData(), error: true, errorMessage: '');
      } else {
        final LoginResData resData = LoginResData.fromJson(response.data);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: ColorConst.red);
      return APIResponse(data: LoginResData(), error: true, errorMessage: '');
    }
  }
}
