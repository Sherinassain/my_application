import 'package:flutter/material.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:my_application/core/common/scale.dart';
import 'package:my_application/core/constants/color.dart';
import 'package:my_application/core/constants/textstyle.dart';
import 'package:my_application/core/exports/config.dart';
import 'package:my_application/presentation/screens/home_screen/controller/home_controller.dart';
import 'package:my_application/presentation/screens/home_screen/widgets/grid_view_list_tile.dart';
import 'package:my_application/routes/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GridViewListing extends StatefulWidget {
  const GridViewListing({super.key});

  @override
  State<GridViewListing> createState() => _GridViewListingState();
}

class _GridViewListingState extends State<GridViewListing> {
  final homeCtrl = Get.put(HomeController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeCtrl.getGridProductList();
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
            title: const Text('Products GridView'),
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
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.blueAccent,
                    ),
                  )
                :(homeCtrl.gridProductList.isNotEmpty)? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: GridView.builder(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount: homeCtrl.gridProductList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5.w,
                            mainAxisSpacing: 5.h,
                            mainAxisExtent: 220),
                        itemBuilder: (context, index) {
                          return AnimationConfiguration.staggeredGrid(
                            columnCount: 2,
                            duration: const Duration(milliseconds: 300),
                            position: index,
                            child: ScaleAnimation(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.fastLinearToSlowEaseIn,
                                child: FadeInAnimation(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    child: GridListTile(
                                      image:
                                          homeCtrl.gridProductList[index].thumbnail,
                                      price: homeCtrl.gridProductList[index].price
                                          .toString(),
                                      title: homeCtrl.gridProductList[index].title,
                                      description: homeCtrl
                                          .gridProductList[index].description,
                                    ))),
                          );
                        }),
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
