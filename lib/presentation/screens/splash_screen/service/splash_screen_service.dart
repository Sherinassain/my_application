

import 'package:my_application/core/utiles/app_utils.dart';
import 'package:my_application/repository/api/api_helper.dart';
import 'package:my_application/repository/api/api_response.dart';

class SplashScreenService{
//  Future<APIResponse<OrderDetailResData>> getOrderDetails({required String? orderId}) async {
//     try {
//       final APIResponse response = await APIHelper.getData(
//         endPoint: '/delivery/orders/$orderId/',
//         header: APIHelper.getApiHeader(access: await AppUtils.getAccessToken()),
//       );
//       if (response.error == true) {
//         return APIResponse(
//             data: OrderDetailResData(), error: true, errorMessage: '');
//       } else {
//         final OrderDetailResData resData =
//             OrderDetailResData.fromJson(response.data['data']);
//         return APIResponse(data: resData, error: false, errorMessage: '');
//       }
//     } catch (e) {
//       AppUtils.logger.e(e);
//       AppUtils.oneTimeSnackBar('Could not complete the request',
//           bgColor: ColorConst.red);

//       return APIResponse(
//           data: OrderDetailResData(), error: true, errorMessage: '');
//     }
//   }


}

