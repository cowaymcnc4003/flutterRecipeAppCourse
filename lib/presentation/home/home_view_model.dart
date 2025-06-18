import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/domain/use_case/get_categories_use_case.dart';
import 'package:flutter_recipe_app_course/domain/use_case/get_dishes_by_category_use_case.dart';
import 'package:flutter_recipe_app_course/presentation/home/home_state.dart';

class HomeViewModel with ChangeNotifier {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetDishesByCategoryUseCase _getDishesByCategoryUseCase;

  HomeViewModel({
    required GetCategoriesUseCase getCategoriesUseCase,
    required GetDishesByCategoryUseCase getDishesByCategoryUseCase,
  })  : _getCategoriesUseCase = getCategoriesUseCase,
        _getDishesByCategoryUseCase = getDishesByCategoryUseCase {
    _fetchCategories();
  }

  HomeState _state = const HomeState(categorys: [
    'All',
    'Indian',
    'Italian',
    'Asian',
    'Chinese',
    'Japanese',
  ], selectedCategory: 'All');
  HomeState get state => _state;

  void _fetchCategories() async {
    _state = state.copyWith(
      categorys: await _getCategoriesUseCase.execute(),
      selectedCategory: 'All',
    );
    notifyListeners();

    await _fetchDishesBycategory('All');
    notifyListeners();
  }

  Future<void> _fetchDishesBycategory(String category) async {
    final dishes = await _getDishesByCategoryUseCase.execute(category);
    _state = state.copyWith(dishes: dishes);
    notifyListeners();
  }

  void onSelectCategory(String category) async {
    _state = state.copyWith(selectedCategory: category);
    notifyListeners();
    await _fetchDishesBycategory(category);
  }
}
