
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_application/core/common/scale.dart';
import 'package:my_application/core/constants/color.dart';
import 'package:my_application/core/constants/image.dart';
import 'package:my_application/core/utiles/app_screen_util.dart';
import 'package:my_application/presentation/screens/network_error_screen/controller/network_error_controller.dart';
import 'package:my_application/presentation/screens/splash_screen/controller/splash_controller.dart';
import 'package:my_application/presentation/screens/widgets/common/common_image_view.dart';
import 'package:my_application/presentation/screens/widgets/common/lato_font_style.dart';

import '../../../core/exports/config.dart';

class NetworkErrorScreen extends StatefulWidget {
  const NetworkErrorScreen({Key? key}) : super(key: key);

  @override
  State<NetworkErrorScreen> createState() => _NetworkErrorScreenState();
}

class _NetworkErrorScreenState extends State<NetworkErrorScreen>
    with TickerProviderStateMixin {
  final networkCtrl = Get.put(NetworkErrorController());
  DateTime? lastPressed;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (_) {
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
          body: SafeArea(
            child: Center(
              child: Center(
                  child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text("No Internet Connection"),
                  SizedBox(
                    height: AppScreenUtil().screenWidth(150),
                    width: AppScreenUtil().screenWidth(150),
                    child: CommonImageView(
                      svgPath: ImageCons.noInternet,
                    ),
                  ),

                const  LatoFontStyle(
                    text: "Please check your internet connection and try again",
                    fontSize: FontSizes.f14,
                    // color: appCtrl.appTheme.white,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: AppScreenUtil().screenHeight(10),
                  ),

                  //retry button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            AppScreenUtil().borderRadius(16)),
                      ),
                      backgroundColor: ColorConst.green3D,
                    ),
                    onPressed: () {
                      // splashCtrl.isTapped = true;
                      // splashCtrl.update();
                      // Future.delayed(const Duration(seconds: 2),(){
                      //   splashCtrl.isTapped = false;
                      //   splashCtrl.update();
                      // });
                      networkCtrl.checkNetwork();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: AppScreenUtil().screenHeight(10),
                          bottom: AppScreenUtil().screenHeight(10),
                          left: AppScreenUtil().screenWidth(20),
                          right: AppScreenUtil().screenWidth(20)),
                      child: LatoFontStyle(
                        text: '  ${"Retry"}  ',
                        fontSize: FontSizes.f14,
                        color: ColorConst.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              )),
            ),
          ),
        ),
      );
    });
  }
}
