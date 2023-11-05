
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_application/core/exports/config.dart';
import 'package:my_application/presentation/screens/home_screen/controller/home_controller.dart';
import 'package:my_application/presentation/screens/home_screen/widgets/grid_view.dart';
import 'package:my_application/presentation/screens/home_screen/widgets/listview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final List<Widget> screens = [
    const GridViewListing(),
    const ListViewScreen()
  ];
      final homeCtrl = Get.put(HomeController());

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: const Center(child: Icon(Icons.grid_3x3)),
            ),
            label: 'Grid view',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: const Center(child: Icon(Icons.list)),
            ),
            label: 'List view',
          ),
        ],
        // BottomNavigationBarItem(
        //   icon: Padding(
        //     padding: EdgeInsets.only(top: 10.h),
        //     child: Center(
        //       child: SvgPicture.asset(selectedIndex == 2
        //           ? IconManager.mailSelected
        //           : IconManager.mail),
        //     ),
        //   ),
        //   label: '',
        // ),
        // BottomNavigationBarItem(
        //   icon: Padding(
        //     padding: EdgeInsets.only(top: 10.h),
        //     child: Center(
        //       child: SvgPicture.asset(selectedIndex == 3
        //           ? IconManager.voiceMailSelectedIcon
        //           : IconManager.voiceMailIcon),
        //     ),
        //   ),
        //   label: '',
        // ),

        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}