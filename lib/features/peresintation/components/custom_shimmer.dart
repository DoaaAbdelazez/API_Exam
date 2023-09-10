import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/app_colors.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Shimmer.fromColors(
        baseColor: AppColors.grey,
        highlightColor: AppColors.white,
        child: Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }
}