import 'package:flutter_recipe_app_course/data/clipboard/default_clipboard_service.dart';
import 'package:flutter_recipe_app_course/data/data_source/local/default_local_storage.dart';
import 'package:flutter_recipe_app_course/data/data_source/local_storage.dart';
import 'package:flutter_recipe_app_course/data/data_source/recipe_data_source.dart';
import 'package:flutter_recipe_app_course/data/data_source/remote/remote_recipe_data_source_impl.dart';
import 'package:flutter_recipe_app_course/data/repository/mock_bookmark_repository_impl.dart';
import 'package:flutter_recipe_app_course/data/repository/mock_ingredient_repository_impl.dart';
import 'package:flutter_recipe_app_course/data/repository/mock_procedure_repository_impl.dart';
import 'package:flutter_recipe_app_course/data/repository/mock_recent_search_repository_impl.dart';
import 'package:flutter_recipe_app_course/data/repository/mock_recipe_repository_impl.dart';
import 'package:flutter_recipe_app_course/domain/clipboard/clipboard_service.dart';
import 'package:flutter_recipe_app_course/domain/repository/bookmark_repository.dart';
import 'package:flutter_recipe_app_course/domain/repository/ingredient_repository.dart';
import 'package:flutter_recipe_app_course/domain/repository/procedure_repository.dart';
import 'package:flutter_recipe_app_course/domain/repository/recent_search_recipe_repository.dart';
import 'package:flutter_recipe_app_course/domain/repository/recipe_repository.dart';
import 'package:flutter_recipe_app_course/domain/use_case/get_categories_use_case.dart';
import 'package:flutter_recipe_app_course/domain/use_case/get_dishes_by_category_use_case.dart';
import 'package:flutter_recipe_app_course/domain/use_case/get_new_recipes_use_case.dart';
import 'package:flutter_recipe_app_course/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe_app_course/domain/use_case/search_recipes_use_case.dart';
import 'package:flutter_recipe_app_course/domain/use_case/toggle_bookmark_recipe_use_case.dart';
import 'package:flutter_recipe_app_course/presentation/home/home_view_model.dart';
import 'package:flutter_recipe_app_course/presentation/ingredient/ingredient_view_model.dart';
import 'package:flutter_recipe_app_course/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:flutter_recipe_app_course/presentation/search/search_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetup() {
  // data source
  getIt.registerSingleton<RecipeDataSource>(RemoteRecipeDataSourceImpl());
  getIt.registerSingleton<LocalStorage>(DefaultLocalStorage());

  // Repository
  getIt.registerSingleton<RecipeRepository>(
    MockRecipeRepositoryImpl(
      recipeDataSource: getIt(),
    ),
    // MockRecipeRepositoryImpl(
    //   recipeDataSource: getIt(),
    // ),
  );
  getIt.registerSingleton<BookmarkRepository>(MockBookmarkRepositoryImpl());
  getIt.registerSingleton<RecentSearchRecipeRepository>(
    MockRecentSearchRepositoryImpl(
      localStorage: getIt(),
    ),
  );

  getIt.registerSingleton<IngredientRepository>(
    MockIngredientRepositoryImpl(),
  );

  getIt.registerSingleton<ProcedureRepository>(
    MockProcedureRepositoryImpl(),
  );

  getIt.registerSingleton<ClipboardService>(
    DefaultClipboardService(),
  );

  // Usecase
  getIt.registerSingleton(GetSavedRecipesUseCase(
      recipeRepository: getIt(), bookmarkRepository: getIt()));

  getIt.registerSingleton(
      SearchRecipesUseCase(recipeRepository: getIt(), localStorage: getIt()));

  getIt.registerSingleton(GetCategoriesUseCase(recipeRepository: getIt()));

  getIt.registerSingleton(GetDishesByCategoryUseCase(
      recipeRepository: getIt(), bookmarkRepository: getIt()));

  getIt.registerSingleton(GetNewRecipesUseCase(recipeRepository: getIt()));

  getIt.registerSingleton(ToggleBookmarkRecipeUseCase(
      bookmarkRepository: getIt(), recipeRepository: getIt()));

  // ViewModel
  getIt.registerFactory<SavedRecipesViewModel>(
    () => SavedRecipesViewModel(
      getSavedRecipesUseCase: getIt(),
      toggleBookmarkRecipeUseCase: getIt(),
    ),
  );
  getIt.registerFactory<SearchViewModel>(
    () => SearchViewModel(
      searchRecipesUseCase: getIt(),
      recentSearchRecipeRepository: getIt(),
    ),
  );
  getIt.registerFactory<HomeViewModel>(
    () => HomeViewModel(
        getCategoriesUseCase: getIt(),
        getDishesByCategoryUseCase: getIt(),
        getNewRecipesUseCase: getIt(),
        toggleBookmarkRecipeUseCase: getIt()),
  );
  getIt.registerFactory<IngredientViewModel>(() => IngredientViewModel(
        ingredientRepository: getIt(),
        procedureRepository: getIt(),
        getDishesByCategoryUseCase: getIt(),
        clipboardService: getIt(),
      ));
}
