import 'package:duaya_app/features/search/presentation/controller/search_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<SearchCubit>(SearchCubit());
  // getIt.registerFactory<AnotherService>(() => AnotherService());
}
