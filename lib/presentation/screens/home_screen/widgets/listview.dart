import 'package:flutter/material.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_application/core/common/scale.dart';
import 'package:my_application/core/constants/color.dart';
import 'package:my_application/core/constants/textstyle.dart';
import 'package:my_application/core/exports/config.dart';
import 'package:my_application/core/utiles/app_screen_util.dart';
import 'package:my_application/presentation/screens/home_screen/controller/home_controller.dart';
import 'package:my_application/presentation/screens/home_screen/widgets/product_details.dart';
import 'package:my_application/presentation/screens/home_screen/widgets/shimmer.dart';
import 'package:my_application/presentation/screens/widgets/common/common_image_view.dart';
import 'package:my_application/routes/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({
    super.key,
  });

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  final homeCtrl = Get.put(HomeController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeCtrl.getProductList();
    });
  }

  DateTime? lastPressed;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        DateTime now = DateTime.now();
        if (lastPressed == null ||
            now.difference(lastPressed!) > Duration(seconds: 2)) {
          lastPressed = now;
          Fluttertoast.showToast(
            msg: "Press back again to exit",
            backgroundColor: Colors.black,
            textColor: Colors.white,
          );
          return false;
        }

        ///Exit the app
        FlutterExitApp.exitApp();
        return true; // Return true to allow the app to exit
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Products ListView'),
            actions: [
              IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  homeCtrl.isLogoutLoading.value = true;
                  clearPreference();

                  Get.offAllNamed(routeName.loginScreen);
                  homeCtrl.isLogoutLoading.value = false;
                },
              ),
            ],
          ),
          body: Obx(
            () => (homeCtrl.isLoading.value == true)
                ? const Center(
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.blueAccent,
                    ),
                  )
                : (homeCtrl.productList.isNotEmpty)?Stack(
                    children: [
                      AnimationLimiter(
                        child: ListView.separated(
                          itemCount: homeCtrl.productList.length,
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 10.h,
                            );
                          },
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          itemBuilder: (BuildContext context, int index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              child: SlideAnimation(
                                duration: const Duration(milliseconds: 240),
                                curve: Curves.fastLinearToSlowEaseIn,
                                child: FadeInAnimation(
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  duration: const Duration(milliseconds: 240),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Colors.grey.shade200),
                                          borderRadius:
                                              BorderRadius.circular(10.r)),
                                      leading: Container(
                                        height: 110.h,
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        child: CommonImageView(
                                          url: homeCtrl
                                              .productList[index].thumbnail
                                              .toString(),
                                        ),
                                      ),
                                      // isThreeLine: true,
                                      title: Text(
                                        homeCtrl.productList[index].title
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.sp,
                                        ),
                                        maxLines: 2,
                                      ),
                                      subtitle: Text(
                                          '\$${homeCtrl.productList[index].price}'),
                                      trailing: InkWell(
                                        onTap: () {
                                          Get.to(ProductDetails(
                                              title: homeCtrl
                                                  .productList[index].title
                                                  .toString(),
                                              price:
                                                  '\$${homeCtrl.productList[index].price}',
                                              image: homeCtrl
                                                  .productList[index].thumbnail
                                                  .toString(),
                                              description: homeCtrl
                                                  .productList[index]
                                                  .description));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(4.r),
                                          child: const Text(
                                            'View more',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Obx(() => (homeCtrl.isLoadMoreLoading.value == true)
                          ? Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 15),
                                child: ShimmerPlaceholder(
                                  height: AppScreenUtil().screenHeight(35),
                                  width: AppScreenUtil().screenWidth(90),
                                ),
                              ),
                            )
                          : (homeCtrl.totalItems == 0 ||
                                  homeCtrl.totalItems ==
                                      homeCtrl.productList.length)
                              ? const SizedBox()
                              : Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        homeCtrl.loadMoreProducts();
                                        print(
                                            'productlist length ${homeCtrl.productList.length}');
                                      },
                                      child: Text('Load More'),
                                    ),
                                  ),
                                ))
                    ],
                  ):Center(
                        child: Text(
                          "No Products",
                          style: TextStyleClass.poppinsMedium(
                              color: ColorConst.grey83, size: FontSizes.f20),
                        ),
                      ),
          )),
    );
  }

  void clearPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(
        'myBooleanPreference'); // Remove the value associated with the key
  }
}
