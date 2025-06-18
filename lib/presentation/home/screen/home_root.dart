import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/di/di_setup.dart';
import 'package:flutter_recipe_app_course/core/routing/route_paths.dart';
import 'package:flutter_recipe_app_course/presentation/home/home_view_model.dart';
import 'package:flutter_recipe_app_course/presentation/home/screen/home_screen.dart';
import 'package:go_router/go_router.dart';

class HomeRoot extends StatelessWidget {
  const HomeRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<HomeViewModel>();
    return ListenableBuilder(
        listenable: viewModel,
        builder: (context, snapshot) {
          return HomeScreen(
            state: viewModel.state,
            name: 'Jega',
            onTapSearchFiled: () => context.push(RoutePaths.search),
            onSelectCategory: viewModel.onSelectCategory,
          );
        });
  }
}
