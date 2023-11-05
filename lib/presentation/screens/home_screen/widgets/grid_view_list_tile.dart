import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_application/core/exports/config.dart';
import 'package:my_application/presentation/screens/home_screen/controller/home_controller.dart';
import 'package:my_application/presentation/screens/home_screen/widgets/product_details.dart';
import 'package:my_application/presentation/screens/widgets/common/common_image_view.dart';
import 'package:my_application/routes/index.dart';

class GridListTile extends StatelessWidget {
  final String? title;
  final String? price;
  final String? image;
  final String? description;

  GridListTile(
      {super.key,
      required this.title,
      required this.price,
      required this.image,
      required this.description});
  final homeCtrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100.h,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10.r)),
            child: CommonImageView(
              url: image.toString(),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            title.toString(),
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 13.sp),
            maxLines: 2,
          ),
          Text('\$${price}'),
          SizedBox(
            height: 5.h,
          ),
          InkWell(
            onTap: () {
              Get.to(ProductDetails(
                  title: title,
                  price: price,
                  image: image,
                  description: description));
            },
            child: Container(
              padding: EdgeInsets.all(5.r),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10.r)),
              child: const Center(child: Text('View Details')),
            ),
          ),
        ],
      ),
    );
  }
}
