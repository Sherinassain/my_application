import 'package:my_application/core/constants/color.dart';
import 'package:my_application/core/utiles/app_utils.dart';
import 'package:my_application/repository/api/api_helper.dart';
import 'package:my_application/repository/api/api_response.dart';

class ForgotPasswordService {
  Future<APIResponse> forgotPassword(
      {required String emailorPhone, required String password}) async {
    final body = {"emailorphonenumber": emailorPhone, "password": password};
    try {
      final APIResponse response = await APIHelper.customPut(
          endPoint: '/forgotpassword',
          header: APIHelper.getApiHeader(),
          body: body);
      if (response.error == true) {
        return APIResponse(data: response, error: true, errorMessage: '');
      } else {
        return APIResponse(data: response, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: ColorConst.red);
      return APIResponse(data: '', error: true, errorMessage: '');
    }
  }
}
