import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/common/common_image_view.dart';

class ProductDetails extends StatelessWidget {
  final String? title;
  final String? price;
  final String? image;
  final String? description;

  const ProductDetails(
      {super.key,
      required this.title,
      required this.price,
      required this.image,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(title.toString())),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 250.h,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: CommonImageView(
                url: image.toString(),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child: Text(
              title.toString(),
              style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
              maxLines: 2,
            ),
          ),
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child: Text(
              '\$$price',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child: const Text(
              'Description',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: Text('$description'))
        ],
      ),
    );
  }
}
