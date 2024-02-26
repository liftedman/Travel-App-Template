import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiking_travel/cubits/app_cubit.dart';
import 'package:hiking_travel/cubits/app_cubit_state.dart';
import 'package:hiking_travel/pages/detail_page.dart';
// import 'package:hiking_travel/pages/nav_bar_page/home_page.dart';
import 'package:hiking_travel/pages/nav_bar_page/main_nav_page.dart';
// import 'package:hiking_travel/pages/nav_bar_page/home_page.dart';
// import 'package:hiking_travel/pages/nav_bar_page/main_nav_page.dart';
import 'package:hiking_travel/pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitSate>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return WelcomePage();
          }
          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LoadedState) {
            return NavMainPage();
          }
          if (state is DetailState) {
            return DetailPageState();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
