
import 'package:my_application/core/exports/config.dart';

class ShimmerPlaceholder extends StatelessWidget {
  final double width;
  final double height;
  final dynamic decoration;
  final dynamic padding;

  ShimmerPlaceholder(
      {required this.width, required this.height, this.decoration,this.padding});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        padding: padding,
        width: width,
        height: height,
        color: Colors.grey[200],
        decoration: decoration,
      ),
    );
  }
}
