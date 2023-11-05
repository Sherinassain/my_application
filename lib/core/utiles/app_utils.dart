//ignore_for_file:file_names
// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:my_application/core/config/session.dart';
import 'package:my_application/core/constants/color.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../app_config.dart';
import '../../../main.dart';
// import '../../routes.dart';

class AppUtils {
  ///use to print any data for testing and later will be useful to remove the print inside this
  printError(data) {
    print('============Error===============');
    print(data);
    print('============Error===============');
  }

  printData(data, {String info = 'DATA'}) {
    print('============$info===============');
    print(data);
    print('============$info===============');
  }

  ///used to set access key in shared preference for testing purpose only
  // setAccess() async {
  //   final sharedPreferences = await SharedPreferences.getInstance();
  //   sharedPreferences.setString('access',
  //       'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjcxMjYwMjMyLCJpYXQiOjE2Njk1MzIyMzIsImp0aSI6IjY1NDVmZDM5OTRlNjQyMjU4Njk2NGE2MDRmOGJlYzUwIiwidXNlcl9pZCI6IjIyMjIyMjIyMjIiLCJuYW1lIjoic3RyaW5nIn0.DK8br6H1FQ0weEzAOJUHWwTzF1LmQVCUcoi_5UVHbUw');
  //   print('access set');
  //   print(sharedPreferences.getString('access'));
  // }

  tapWithNetworkCheckn(Function() function) {
    if (true) {
      function();
    }
  }

  // Future<Map> getSharedPrefMap() async {
  //   final sharedPreferences = await SharedPreferences.getInstance();
  //   final map = jsonDecode(sharedPreferences.get('appData1') as String);
  //   return map;
  // }

  ///to log data for debugging
  static Logger logger = Logger();

  ///Used to create an exit dialog with app exit function. Used in Appbar and Home Screen(back button)
//   static Future<bool> onWillPopFunction(context) async {
//     await showDialog(
//         context: context!,
//         useRootNavigator: false,
//         barrierColor: Theme.of(context).primaryColor.withOpacity(0.1),
//         builder: (_) => BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//             child: AlertDialog(
//               insetPadding: EdgeInsets.symmetric(horizontal: 3*UtilDynamicSize(Get.context!).width10, vertical: 0),
//               // contentPadding: EdgeInsets.zero,
//               backgroundColor: Colors.white,
//               actionsPadding: EdgeInsets.only(bottom: 0, top: 0),
//               contentPadding: EdgeInsets.only(left: 2*UtilDynamicSize(Get.context!).width10, top: 1.5*UtilDynamicSize(Get.context!).height10),
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(1.5*UtilDynamicSize(Get.context!).width10),
//                   side: BorderSide(
//                       width: 1, color: Theme.of(context).primaryColor)),
//               content: Container(
//                 width: MediaQuery.of(context).size.width,
//                 child: Text(
//                     'Are you sure want to exit?',
//                     textScaleFactor: MediaQuery.of(context).size.width/375,
//                     style: TextStyle(
//                       // color: ColorConstant.whiteA700,
//                       fontSize: 14,
//                       fontFamily: 'Roboto',
//                       fontWeight: FontWeight.w400,
//                     ),
//                     // style:AppStyle.txtPlusJakartaSansMedium16.copyWith(fontSize:15)
//                 ),
//               ),
//               actions: [
// /*
//  Visibility(
//                   visible: isTeacher!?true:false,
//                   child: TextButton(
//                       onPressed: () {
//                         pushNewScreen(context,
//                             screen: BottomBarAnimatedScreen(
//                                 menuScreenContext: context));
//                       },
//                       child: Container(
//                         height:
//                         ScreenSizeInfo(context).blockSizeHorizontal * 10,
//                         width: ScreenSizeInfo(context).blockSizeHorizontal * 30,
//                         decoration: BoxDecoration(
//                             color: color1CounselingCard,
//                             borderRadius: BorderRadius.circular(
//                                 ScreenSizeInfo(context).blockSizeHorizontal *
//                                     10)),
//                         child: Center(
//                           child: Text(
//                             ' To Teacher',
//                             textScaleFactor: ScreenSizeInfo(context).width /
//                                 ScreenSizeInfo(context).uiWidth,
//                             style: GoogleFonts.nunito(
//                                 fontSize: 17, color: Colors.white),
//                           ),
//                         ),
//                       )),
//                 ),
// */
//
//                 TextButton(
//                     onPressed: () {
//                       SystemNavigator.pop();
//                       // _sharedPreferences.remove(Constance.sharedAccess);
//                       // _sharedPreferences.remove(Constance.sharedStudId);
//                       // _sharedPreferences.remove(Constance.sharedStudName);
//                       // Navigator.popAndPushNamed(context, LoginScreen.id);
//                     },
//                     child: Text(
//                         'Yes',
//
//                         textScaleFactor: MediaQuery.of(context).size.width/375,
//                       style: TextStyle(
//                         // color: ColorConstant.whiteA700,
//                         fontSize: 14,
//                         fontFamily: 'Roboto',
//                         fontWeight: FontWeight.w400,
//                       ),
//                         // style: AppStyle.txtPlusJakartaSansMedium16.copyWith(color: Colors.black,fontSize:14 )
//                     )),
//                 TextButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: Text(
//                         'No',
//                         textScaleFactor: MediaQuery.of(context).size.width/375,
//                       style: TextStyle(
//                         // color: ColorConstant.whiteA700,
//                         fontSize: 14,
//                         fontFamily: 'Roboto',
//                         fontWeight: FontWeight.w400,
//                       ),
//                         // style: AppStyle.txtPlusJakartaSansMedium16.copyWith(color: Colors.black,fontSize: 14)
//                     )),
//               ],
//             )));
//     return false;
//   }

  clearSnackBar() {
    ScaffoldMessenger.of(Get.context!).clearSnackBars();
  }

  // static NumberFormat formatter = NumberFormat('#,##,000');
  static snackBar(
    String? message, {
    int time = 2,
    Color? bgColor,
    TextStyle? textStyle,
    BuildContext? context,
    bool showOnTop = false,
  }) {
    // ScaffoldMessenger.of(Get.context!).clearSnackBars();///To CLEAR PREVIOUS SNACK BARS
    return ScaffoldMessenger.of(context ?? Get.context!).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: bgColor ?? Colors.blue,
        content: Text(message!, style: textStyle),
        duration: Duration(seconds: time),
        margin: showOnTop
            ? EdgeInsets.only(
                bottom:
                    MediaQuery.of(context ?? Get.context!).size.height - 100,
                right: 20,
                left: 20)
            : null,
      ),
    );
  }

  static tapWithNetworkCheck(Function() function) async {
    if (await AppUtils.isOnline()) {
      function;
    }
  }

  static oneTimeSnackBar(
    String? message, {
    int time = 2,
    Color? bgColor,
    TextStyle? textStyle,
    BuildContext? context,
    bool showOnTop = false,
  }) {
    ScaffoldMessenger.of(Get.context!).clearSnackBars();

    ///To CLEAR PREVIOUS SNACK BARS
    return ScaffoldMessenger.of(context ?? Get.context!)
        // ScaffoldMessenger.of(context??Get.context!)
        .showSnackBar(
      SnackBar(
        /*action:SnackBarAction(label: "Ok",
        onPressed: (){
          SystemSettings.internalStorage();
        },
        ) ,*/

        behavior: showOnTop ? SnackBarBehavior.floating : null,
        backgroundColor: bgColor ?? ColorConst.appColor,
        content: Text(message!, style: textStyle),
        duration: Duration(seconds: time),
        margin: showOnTop
            ? EdgeInsets.only(
                bottom:
                    MediaQuery.of(context ?? Get.context!).size.height - 100,
                right: 20,
                left: 20)
            : null,
      ),
    );
  }

  static oneTimeSnackBarAction(String? message,
      {int time = 2,
      Color? bgColor,
      TextStyle? textStyle,
      BuildContext? context,
      bool showOnTop = false,
      String? actionText,
      Function()? action}) {
    ScaffoldMessenger.of(Get.context!).clearSnackBars();

    ///To CLEAR PREVIOUS SNACK BARS
    return ScaffoldMessenger.of(context ?? Get.context!).showSnackBar(
      SnackBar(
        action: SnackBarAction(
            textColor: Colors.white,
            label: actionText ?? "Go to cart".tr,
            onPressed: action ?? () {}),
        behavior: showOnTop ? SnackBarBehavior.floating : null,
        backgroundColor: bgColor ?? Color(0xff9EBF6D),
        content: Text(message!, style: textStyle),
        duration: Duration(seconds: time),
        margin: showOnTop
            ? EdgeInsets.only(
                bottom:
                    MediaQuery.of(context ?? Get.context!).size.height - 100,
                right: 20,
                left: 20)
            : null,
      ),
    );
  }

  static bool validationOfEmail(String emailPassed) {
    var email = emailPassed;
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  static bool validationOfName(String namePassed) {
    var name = namePassed;
    bool nameValid = RegExp(r"^[a-zA-Z ][a-zA-Z ]+[a-zA-Z ]$").hasMatch(name);
    return nameValid;
  }

  static bool validationOfPIN(String passedPIN) {
    var pin = passedPIN;
    bool isValid = RegExp(r"^[1-9]{1}\d{2}\s?\d{3}$").hasMatch(pin);
    return isValid;
  }

  static bool validationOfPhone(String passedPhone) {
    var phone = passedPhone;
    bool isValid = RegExp(r"^[0-9]{10,10}").hasMatch(phone);
    return isValid;
  }

  ///Used to check internet connectivity with package => internet_connection_checker: ^0.0.1+3
  ///user this on every btn / or can be implemented on service before API call
  static Future<bool> isOnline() async {
    bool isOnline = await InternetConnectionChecker().hasConnection;
    if (isOnline) {
      return true;
    } else {
      oneTimeSnackBar('No network connection!', bgColor: ColorConst.green3D);
      return false;
    }
  }

  ///requires in_app_update package to work.
  static Future<void> checkForUpdate() async {
    try {
      AppUpdateInfo? _updateInfo;
      InAppUpdate.checkForUpdate().then((info) {
        _updateInfo = info;
        if (UpdateAvailability.updateAvailable == 2) {
          print('update available');
          InAppUpdate.performImmediateUpdate().catchError((e) {
            AppUtils().printError('performImmediateUpdate()');
            AppUtils().printError(e);
          });
        }
      });
      //this means update is available
    } catch (e) {
      print("error checkForUpdate(");
      print(e);
    }
  }

  ///Dotted line
  static Widget generateDottedLine({Color? dashColor}) {
    return Row(
      children: List.generate(
          1000 ~/ 10,
          (index) => Expanded(
                child: Container(
                  color: index % 2 == 0
                      ? Colors.transparent
                      : dashColor ?? Colors.black,
                  height: 0.5,
                ),
              )),
    );
  }

  ///date format
  static String dateFormatterDMY(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String dateFormatterDMonthY(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }

  static String dateFormatterDMonthYHHmmAM(DateTime date) {
    return DateFormat('dd  MMM yyyy hh:mm a').format(date);
  }

  static void throwError(Object e) {
    print("Error caught----XXXXXX--XXXX--XXX-");
    throw e;
  }

  static getAccessToken() {
    // return "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjgyNTk2MjI4LCJpYXQiOjE2ODA4NjgyMjgsImp0aSI6IjE0ZTA4YTY3MDhhZDQwMjhhNzM0MzNmMDRlN2I4NmIyIiwidXNlcl9pZCI6IjIyMjIyMjIyMjIiLCJuYW1lIjoiICIsInJvbGUiOjV9.W7xF2bTogtFyNCFSD_srNtZK1Knq3Tq7pOniwSwKtvo";
    return GetStorage().read(Session.authToken) ?? '';
  }

  static getId() {
    return GetStorage().read(Session.id) ?? '';
  }
  ///helper functions

  // static Future<String> getAccessToken() async {
  //   // Future<String> getAccessKey() async {
  //   final sharedPreferences = await SharedPreferences.getInstance();
  //   late final access;
  //   if (sharedPreferences.get(AppConfig.ACCESS) != null) {
  //     access = sharedPreferences.get(AppConfig.ACCESS);
  //   } else {
  //     access = '';
  //   }
  //   return access;
  // }
  // static Future<dynamic> getValue(String sharedKey) async {
  //   // Future<String> getAccessKey() async {
  //   final sharedPreferences = await SharedPreferences.getInstance();
  //   late final access;
  //   if (sharedPreferences.get(sharedKey) != null) {
  //     access = sharedPreferences.get(sharedKey);
  //     return access;
  //   } else {
  //     return null;
  //   }
  // }

  ///used this for myrent
  // static Future<String?> getAccessKey() async {
  //   final sharedPreferences = await SharedPreferences.getInstance();
  //   if(sharedPreferences.get(AppConfig.LOGIN_DATA)!=null){
  //     final access =
  //     jsonDecode(sharedPreferences.get(AppConfig.LOGIN_DATA) as String)['access'];
  //     return access;
  //   }else{
  //     return null;
  //   }
  //
  // }

  ///helper functions end
}

class AppUtilDynamicSize {
  late BuildContext context;
  double screenHeight = 0;
  double screenWidth = 0;
  double height10 = 0;
  double width10 = 0;
  double width1 = 0;
  double blockSizeVertical = 0;
  double blockSizeHorizontal = 0;
  double uiWidth = 375;
  double uiHeight = 812;
  double textScaleFactor = 0;
  double ratioWidth1 = 0;
  double ratioHeight1 = 0;
  AppUtilDynamicSize(this.context) {
    this.screenHeight = MediaQuery.of(context).size.height < 600
        ? 600
        : MediaQuery.of(context).size.height;
    this.screenWidth = MediaQuery.of(context).size.width;
    this.height10 = screenHeight / (812 / 10); //use this only
    this.width10 = screenWidth / (375 / 10); //use this only
    this.width1 = screenWidth / (375 / 1);
    // print("width: $screenWidth");
    // print("height: $screenHeight");
    this.blockSizeVertical = MediaQuery.of(context).size.height / 100;
    this.blockSizeHorizontal = MediaQuery.of(context).size.width / 100;
    this.textScaleFactor = screenWidth / uiWidth;
    // print("blockSizeHorizontal : $blockSizeHorizontal");
    this.ratioWidth1 = (1 / uiWidth) * screenWidth;
    this.ratioHeight1 = (1 / uiHeight) * screenHeight;
    // print("ratioWidth10: $ratioWidth1");
    // print("ratioHeight10: $ratioHeight1");
  }
}

///used to capitalize the strings
extension StringExtension on String {
  String capitalizeFirstL() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

///to format the money / amount us format
final amountFormatter = new NumberFormat(
  "##,##,##0",
  "en_US",
);

///to format the money / amount seperated with commas 1,20,000

final amountFormatterIn = new NumberFormat(
  "#,##,##0",
  "en_IN",
);

// final moneyFormat = NumberFormat.compactCurrency(decimalDigits: 1, symbol: '',locale:"en_IN");
final moneyFormat =
    NumberFormat.compactCurrency(decimalDigits: 0, symbol: '', locale: "en_US");
////
// controller.financeData.value.paid_amount==null?'':
// amountFormatter.format(controller.financeData.value.paid_amount),
