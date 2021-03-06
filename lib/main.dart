import 'package:block_cubit_example/controller/cubits/home_page_controller_cubit.dart';
import 'package:block_cubit_example/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: child,
          );
        },
        child: MultiBlocProvider(
          providers: [
            BlocProvider<HomePageControllerCubit>(
                create: (BuildContext context) => HomePageControllerCubit(0))
          ],
          child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: HomeScreen()),
        ));
  }
}
