import 'package:flutter/material.dart';
import 'package:my_application/core/exports/config.dart';
import 'package:my_application/presentation/screens/login_screen/login_screen.dart';
import 'package:my_application/routes/index.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (_, child) =>  GetMaterialApp(
           builder: (context, widget) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: SafeArea(child: widget!),
          );
        },
        debugShowCheckedModeBanner: false,
          locale: const Locale('en', 'US'),
          fallbackLocale: const Locale('en', 'US'),
          initialRoute: '/',
        // home: Get.toNamed(routeName.splashScreen),
        getPages: appRoute.getPages
      ),
    );
  }
}


