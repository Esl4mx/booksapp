import 'package:booksapp/Features/home/data/repos/home_repo_impl.dart';
import 'package:booksapp/Features/search/data/repos/search_repo.dart';
import 'package:booksapp/Features/search/data/repos/search_repo_impl.dart';
import 'package:booksapp/core/utlis/api_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiSerrvice>(ApiSerrvice(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiSerrvice>()));
  getIt.registerSingleton<SearchRepoImpl>(
      SearchRepoImpl(getIt.get<ApiSerrvice>()));
}
