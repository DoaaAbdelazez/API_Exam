
import 'package:cached_network_image/cached_network_image.dart';
import 'package:exam_api/core/utils/app_colors.dart';
import 'package:exam_api/features/peresintation/components/custom_shimmer.dart';
import 'package:exam_api/features/peresintation/cubit/cat_cubit.dart';
import 'package:exam_api/features/peresintation/cubit/cat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageComponent extends StatelessWidget {
  const ImageComponent({
    super.key,
    required this.image,
  });
  final int image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<CatCubit, CatState>(
        builder: (context, state) {
          return Container(
            width: 100.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.transparent,
                  spreadRadius: 5,
                  blurRadius: 5,
                ),
              ],
            ),
            child: state is GetCatSucessState
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: BlocProvider.of<CatCubit>(context).cats[image]
                          ['url'],
                      fit: BoxFit.fitWidth,
                      placeholder: (context, url) => const CustomShimmer(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  )
                : const CustomShimmer(),
          );
        },
      ),
    );
  }
}