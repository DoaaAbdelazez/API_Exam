import 'package:exam_api/core/services/services_locator.dart';
import 'package:exam_api/features/peresintation/cubit/cat_cubit.dart';
import 'package:exam_api/features/peresintation/screens/cat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(400, 800),
        builder: (context, child) {
          return BlocProvider(
            create: (context) => sl<CatCubit>()..getCats(),
            child: const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: CatsScreen(),
            ),
          );
        });
  }
}
