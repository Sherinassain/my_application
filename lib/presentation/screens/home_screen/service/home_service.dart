import 'package:my_application/core/constants/color.dart';
import 'package:my_application/core/utiles/app_utils.dart';
import 'package:my_application/presentation/screens/home_screen/service/res_model/home_screen_res_model.dart';
import 'package:my_application/repository/api/api_helper.dart';
import 'package:my_application/repository/api/api_response.dart';

class HomeScreenService {
  Future<APIResponse<HomeScreenResData>> getProductList() async {
    try {
      final APIResponse response = await APIHelper.getData(
        finalUrl: 'https://dummyjson.com/products?limit=30',
        endPoint: 'products',
        header: APIHelper.getApiHeader(),
      );
      if (response.error == true) {
        return APIResponse(
            data: HomeScreenResData(), error: true, errorMessage: '');
      } else {
        final HomeScreenResData resData =
            HomeScreenResData.fromJson(response.data);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: ColorConst.red);

      return APIResponse(
          data: HomeScreenResData(), error: true, errorMessage: '');
    }
  }

  Future<APIResponse<HomeScreenResData>> loadMoreProducts(
      {required String limit,required String index}) async {
    try {
      final APIResponse response = await APIHelper.getData(
        finalUrl: 'https://dummyjson.com/products?limit=30&skip=$index',
        endPoint: '',
        header: APIHelper.getApiHeader(),
      );
      if (response.error == true) {
        return APIResponse(
            data: HomeScreenResData(), error: true, errorMessage: '');
      } else {
        final HomeScreenResData resData =
            HomeScreenResData.fromJson(response.data);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: ColorConst.red);
      return APIResponse(
          data: HomeScreenResData(), error: true, errorMessage: '');
    }
  }
   Future<APIResponse<HomeScreenResData>> getGridProductList() async {
    try {
      final APIResponse response = await APIHelper.getData(
        finalUrl: 'https://dummyjson.com/products',
        endPoint: 'products',
        header: APIHelper.getApiHeader(),
      );
      if (response.error == true) {
        return APIResponse(
            data: HomeScreenResData(), error: true, errorMessage: '');
      } else {
        final HomeScreenResData resData =
            HomeScreenResData.fromJson(response.data);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: ColorConst.red);

      return APIResponse(
          data: HomeScreenResData(), error: true, errorMessage: '');
    }
  }
}
