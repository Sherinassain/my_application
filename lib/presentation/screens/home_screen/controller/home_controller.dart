import 'package:get/get.dart';
import 'package:my_application/core/utiles/app_utils.dart';
import 'package:my_application/presentation/screens/home_screen/service/home_service.dart';
import 'package:my_application/presentation/screens/home_screen/service/res_model/home_screen_res_model.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var isLoadMoreLoading = false.obs;

  var isLogoutLoading = false.obs;
  RxList productList = [].obs;
  List<Product> gridProductList = [];
  num? totalItems;

  int skip = 30;
  Future<void> getProductList() async {
    isLoading.value = true;
    update();
    try {
      ///avoids duplicate items
      productList.clear();
      totalItems = 0;
      final parsedResData = await HomeScreenService().getProductList();
      if (parsedResData.error != true) {
        // deliveredOrderNextPageUrl.value = parsedResData.data.next ?? '';

        if (parsedResData.data.products != null &&
            parsedResData.data.products!.isNotEmpty) {
          for (var element in parsedResData.data.products!) {
            productList.add(Product(
              id: element.id,
              title: element.title,
              description: element.description,
              price: element.price,
              discountPercentage: element.discountPercentage,
              rating: element.rating,
              stock: element.stock,
              brand: element.brand,
              category: element.category,
              thumbnail: element.thumbnail,
              images: element.images,
            ));
          }
          totalItems = parsedResData.data.total;
        }

        isLoading.value = false;
        update();

        AppUtils().printData(parsedResData.data, info: "product  list");
      } else {
        AppUtils.oneTimeSnackBar("Couldn't fetch data");
        isLoading.value = false;

        update();
      }
    } catch (e) {
      isLoading.value = false;

      update();
      print('Delivered order res data : $e');
    }
  }

  loadMoreProducts() async {
    isLoadMoreLoading.value = true;
    update();
    try {
      final parsedResData = await HomeScreenService()
          .loadMoreProducts(limit: '6', index: skip.toString());
      if (parsedResData.error != true) {
        // deliveredOrderNextPageUrl.value = parsedResData.data.next ?? '';

        if (parsedResData.data.products != null &&
            parsedResData.data.products!.isNotEmpty) {
          for (var element in parsedResData.data.products!) {
            productList.add(Product(
              id: element.id,
              title: element.title,
              description: element.description,
              price: element.price,
              discountPercentage: element.discountPercentage,
              rating: element.rating,
              stock: element.stock,
              brand: element.brand,
              category: element.category,
              thumbnail: element.thumbnail,
              images: element.images,
            ));
          }
          skip += 30;
          update();
        }

        isLoadMoreLoading.value = false;
        update();

        AppUtils().printData(parsedResData.data, info: "product  list");
      } else {
        AppUtils.oneTimeSnackBar("Couldn't fetch data");
        isLoadMoreLoading.value = false;

        update();
      }
    } catch (e) {
      isLoadMoreLoading.value = false;

      update();
      print('Delivered order res data : $e');
    }
  }

  Future<void> getGridProductList() async {
    isLoading.value = true;
    update();
    try {
      ///avoids duplicate items
      gridProductList.clear();
      final parsedResData = await HomeScreenService().getGridProductList();
      if (parsedResData.error != true) {
        // deliveredOrderNextPageUrl.value = parsedResData.data.next ?? '';

        if (parsedResData.data.products != null &&
            parsedResData.data.products!.isNotEmpty) {
          for (var element in parsedResData.data.products!) {
            gridProductList.add(Product(
              id: element.id,
              title: element.title,
              description: element.description,
              price: element.price,
              discountPercentage: element.discountPercentage,
              rating: element.rating,
              stock: element.stock,
              brand: element.brand,
              category: element.category,
              thumbnail: element.thumbnail,
              images: element.images,
            ));
          }
        }

        isLoading.value = false;
        update();

        AppUtils().printData(parsedResData.data, info: "product  list");
      } else {
        AppUtils.oneTimeSnackBar("Couldn't fetch data");
        isLoading.value = false;

        update();
      }
    } catch (e) {
      isLoading.value = false;

      update();
      print('Delivered order res data : $e');
    }
  }
}
