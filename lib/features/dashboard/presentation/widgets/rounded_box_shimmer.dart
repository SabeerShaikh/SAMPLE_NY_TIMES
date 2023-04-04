import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class RoundedBoxShimmer extends StatelessWidget {
  final double width;
  final double height;
  const RoundedBoxShimmer({Key? key, this.width = 72.65, this.height = 72.65})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      enabled: true,
      direction: ShimmerDirection.ltr,
      loop: 0,
      period: Duration(milliseconds: 1000),
      child: Container(
        width: width.w,
        height: width.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0.r),
          color: Colors.white,
        ),
      ),
    );
  }
}
