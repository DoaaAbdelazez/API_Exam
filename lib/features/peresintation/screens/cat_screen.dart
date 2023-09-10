import 'package:exam_api/features/peresintation/components/image_component.dart';
import 'package:exam_api/features/peresintation/cubit/cat_cubit.dart';
import 'package:exam_api/features/peresintation/cubit/cat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';

class CatsScreen extends StatelessWidget {
  const CatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatCubit, CatState>(
      builder: (context, state) {
        final catCubit = BlocProvider.of<CatCubit>(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.blue,
            title: const Text(AppStrings.appName),
            centerTitle: true,
            actions: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      catCubit.getCats();
                    },
                    icon: const Icon(Icons.refresh),
                  ),
                ],
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: MasonryGridView.count(
              crossAxisCount: 3,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Tooltip(
                  message: state is GetCatSucessState
                      ? catCubit.cats[index]['id']
                      : '',
                  child: ImageComponent(
                    image: index,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
