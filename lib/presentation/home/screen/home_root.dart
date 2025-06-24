import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/di/di_setup.dart';
import 'package:flutter_recipe_app_course/core/routing/route_paths.dart';
import 'package:flutter_recipe_app_course/presentation/home/home_view_model.dart';
import 'package:flutter_recipe_app_course/presentation/home/screen/home_screen.dart';
import 'package:go_router/go_router.dart';

class HomeRoot extends StatefulWidget {
  const HomeRoot({super.key});

  @override
  State<HomeRoot> createState() => _HomeRootState();
}

class _HomeRootState extends State<HomeRoot> {
  late HomeViewModel viewModel;
  StreamSubscription? eventSubscription;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<HomeViewModel>();
    eventSubscription = viewModel.eventStream.listen((event) {
      log(event.toString());
      if (mounted) {
        final snackBar = SnackBar(content: Text(event.toString()));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  @override
  void dispose() {
    eventSubscription?.cancel();
    super.dispose();
  }

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
