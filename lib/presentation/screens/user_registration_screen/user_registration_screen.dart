import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_application/core/common/scale.dart';
import 'package:my_application/core/constants/color.dart';
import 'package:my_application/core/constants/image.dart';
import 'package:my_application/core/constants/textstyle.dart';
import 'package:my_application/core/exports/config.dart';
import 'package:my_application/core/utiles/app_screen_util.dart';
import 'package:my_application/core/utiles/app_utils.dart';
import 'package:my_application/core/utiles/utiles.dart';
import 'package:my_application/presentation/screens/home_screen/home_screen.dart';
import 'package:my_application/presentation/screens/login_screen/controller/login_controller.dart';
import 'package:my_application/presentation/screens/user_registration_screen/controller/user_registration_controller.dart';
import 'package:my_application/routes/index.dart';

class UserRegistration extends StatefulWidget {
  UserRegistration({super.key});

  @override
  State<UserRegistration> createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  final userRegCtrl = Get.put(UserRegistrationController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize:
                    Size.fromHeight(AppScreenUtil().screenHeight(100)),
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorConst.white,
                  ),
                  child: Center(
                      child: Padding(
                    padding:
                        EdgeInsets.only(top: AppScreenUtil().screenWidth(40)),
                    child: Image.asset(ImageCons.regImage),
                  )),
                )),
            backgroundColor: ColorConst.white,
            body: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: AppScreenUtil().screenHeight(480),
                decoration: BoxDecoration(
                  color: ColorConst.white.withOpacity(0.9),
                ),
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
                          "Register",
                          style: TextStyleClass.poppinsRegular(
                              color: Colors.black, size: 28.0),
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(60),
                        ),
                        TextFormFieldCom(
                          formKey: userRegCtrl.firstNameFormKey,
                          controller: userRegCtrl.firstNameController,
                          hintText: 'First name',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter a valid first name";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(20),
                        ),
                        TextFormFieldCom(
                          formKey: userRegCtrl.lastNameFormKey,
                          controller: userRegCtrl.lastNameController,
                          hintText: 'Last name',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter a valid last name";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: AppScreenUtil().screenHeight(20),
                        ),
                        TextFormFieldCom(
                          formKey: userRegCtrl.emailorPhoneNumberFormKey,
                          controller: userRegCtrl.emailorPhoneNumberController,
                          hintText: 'Email',
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
                          formKey: userRegCtrl.PasswordFormKey,
                          controller: userRegCtrl.PasswordController,
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
                          () => (userRegCtrl.isLoading.value == true)
                              ? CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: ColorConst.green3D,
                                )
                              : CommonButton(
                                  color: ColorConst.green3D,
                                  title: "Sign Up",
                                  fontSize: FontSizes.f15,
                                  onPresss: () {
                                    if (userRegCtrl
                                            .firstNameFormKey.currentState!
                                            .validate() &&
                                        userRegCtrl
                                            .lastNameFormKey.currentState!
                                            .validate() &&
                                        userRegCtrl.emailorPhoneNumberFormKey
                                            .currentState!
                                            .validate() &&
                                        userRegCtrl
                                            .PasswordFormKey.currentState!
                                            .validate()) {
                                      userRegCtrl
                                          .userRegistration(
                                              firstName: userRegCtrl
                                                  .firstNameController.text,
                                              lastName: userRegCtrl
                                                  .lastNameController.text,
                                              emailorPhone: userRegCtrl
                                                  .emailorPhoneNumberController
                                                  .text,
                                              password: userRegCtrl
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
