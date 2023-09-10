import 'package:exam_api/core/utils/app_colors.dart';
import 'package:exam_api/core/utils/app_strings.dart';
import 'package:exam_api/features/peresintation/cubit/cat_cubit.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.grey,
        appBar: AppBar(
            backgroundColor: AppColors.blue,
            title: const Text(AppStrings.appName),
            centerTitle: true,
            actions: [
              Row(
                children: [
                  const Text(AppStrings.cats),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.refresh),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
