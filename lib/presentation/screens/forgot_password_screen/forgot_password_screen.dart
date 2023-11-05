import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_application/core/common/scale.dart';
import 'package:my_application/core/constants/color.dart';
import 'package:my_application/core/constants/textstyle.dart';
import 'package:my_application/core/utiles/app_screen_util.dart';
import 'package:my_application/core/utiles/utiles.dart';
import 'package:my_application/presentation/screens/forgot_password_screen/controller/forgot_password_controller.dart';
import 'package:my_application/presentation/screens/splash_screen/controller/splash_controller.dart';
import 'package:my_application/routes/index.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final forgotCtrl = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize:
                    Size.fromHeight(AppScreenUtil().screenHeight(100)),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black87,
                  ),
                  child: Center(
                    child: Text(
                      "Forgot password",
                      style: TextStyleClass.poppinsRegular(
                          color: Colors.white70, size: 20.0),
                    ),
                  ),
                )),
            backgroundColor: Colors.black87,
            body: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: AppScreenUtil().screenHeight(480),
                decoration: BoxDecoration(
                    color: ColorConst.loginContainerColor.withOpacity(0.9),
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(70))),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: AppScreenUtil().screenWidth(30),
                      left: AppScreenUtil().screenWidth(20),
                      right: AppScreenUtil().screenWidth(20),
                      bottom: AppScreenUtil().screenWidth(20)),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Set new password",
                          style: TextStyleClass.poppinsRegular(
                              color: Colors.black, size: 28.0),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(60),
                        ),
                        TextFormFieldCom(
                          formKey: forgotCtrl.emailorPhoneNumberFormKey,
                          controller: forgotCtrl.emailorPhoneNumberController,
                          hintText: 'Email or phone number',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter an email address";
                            }

                            // Define a regular expression for email validation
                            final emailRegex = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

                            if (!emailRegex.hasMatch(value)) {
                              return "Please enter a valid email address";
                            }

                            return null;
                          },
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(20),
                        ),
                        TextFormFieldCom(
                          formKey: forgotCtrl.PasswordFormKey,
                          controller: forgotCtrl.PasswordController,
                          hintText: 'Password',
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 8) {
                              return "Please enter a valid password";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(20),
                        ),
                        Obx(
                          () => (forgotCtrl.isLoading.value == true)
                              ? CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: ColorConst.black,
                                )
                              : CommonButton(
                                  color: Colors.black87,
                                  title: "Change password",
                                  fontSize: FontSizes.f15,
                                  onPresss: () {
                                    if (forgotCtrl.emailorPhoneNumberFormKey
                                            .currentState!
                                            .validate() &&
                                        forgotCtrl.PasswordFormKey.currentState!
                                            .validate()) {
                                      forgotCtrl
                                          .forgotPassword(
                                              emailorPhone: forgotCtrl
                                                  .emailorPhoneNumberController
                                                  .text,
                                              password: forgotCtrl
                                                  .PasswordController.text)
                                          .then((value) {
                                        if (value == true) {
                                          Get.offNamed(routeName.loginScreen);
                                        }
                                      });
                                    }
                                  },
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}
