import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiking_travel/cubits/app_cubit.dart';
import 'package:hiking_travel/cubits/app_cubit_logics.dart';
import 'package:hiking_travel/services/data_service.dart';
// import 'package:hiking_travel/cubits/app_cubit_state.dart';
// import 'package:hiking_travel/pages/detail_page.dart';
// import 'package:hiking_travel/pages/nav_bar_page/main_nav_page.dart';
// import 'package:hiking_travel/pages/welcome_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<AppCubits>(
        create: (context) => AppCubits(
          data: DataService(),
        ),
        child: const AppCubitLogics(),
      ),
    );
  }
}
