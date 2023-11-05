import 'package:my_application/presentation/screens/forgot_password_screen/binding/forgot_password_binding.dart';
import 'package:my_application/presentation/screens/forgot_password_screen/forgot_password_screen.dart';
import 'package:my_application/presentation/screens/home_screen/binding/home_binding.dart';
import 'package:my_application/presentation/screens/home_screen/home_screen.dart';
import 'package:my_application/presentation/screens/home_screen/widgets/product_details.dart';
import 'package:my_application/presentation/screens/login_screen/binding/login_binding.dart';
import 'package:my_application/presentation/screens/login_screen/login_screen.dart';
import 'package:my_application/presentation/screens/splash_screen/binding/splash_binding.dart';
import 'package:my_application/presentation/screens/splash_screen/splash_screen.dart';
import 'package:my_application/presentation/screens/user_registration_screen/binding/user_registration_binding.dart';
import 'package:my_application/presentation/screens/user_registration_screen/user_registration_screen.dart';

import 'route_name.dart';
import 'screens_list.dart';

RouteName _routeName = RouteName();

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(
        name: '/', page: () => const SplashScreen(),),
        GetPage(
        name: _routeName.loginScreen, page: () =>  LoginScreen(),
        
        ),
          GetPage(
        name: _routeName.homeScreen, page: () =>   HomeScreen(),
        ),
           GetPage(
        name: _routeName.userRegistration, page: () =>   UserRegistration(),
        ),
            GetPage(
        name: _routeName.forgotPasswordScreen, page: () =>   const ForgotPasswordScreen(),
        
        ),
      
  ];
}
