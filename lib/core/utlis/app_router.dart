import 'package:booksapp/Features/home/data/models/book_model/book_model.dart';
import 'package:booksapp/Features/home/data/repos/home_repo_impl.dart';
import 'package:booksapp/Features/home/presentation/views/book_details_view.dart';
import 'package:booksapp/Features/home/presentation/views/home_view.dart';
import 'package:booksapp/Features/home/presentation/views_models/relevance_books_cubit/relevance_books_cubit.dart';
import 'package:booksapp/Features/search/data/repos/search_repo_impl.dart';
import 'package:booksapp/Features/search/presentation/views/search_view.dart';
import 'package:booksapp/Features/search/presentation/views_models/cubit/searchbook_cubit.dart';
import 'package:booksapp/Features/splash/presentation/views/splash_view.dart';
import 'package:booksapp/core/utlis/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const homeviewRoute = "/homeView";
  static const searchviewRoute = "/SearchView";
  static const bookDetailsViewRoute = "/bookDetailsView";

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashViwe(),
      ),
      GoRoute(
        path: homeviewRoute,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: bookDetailsViewRoute,
        builder: (context, state) => BlocProvider(
          create: (context) => RelevanceBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(
            book: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: searchviewRoute,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchbookCubit(getIt.get<SearchRepoImpl>()),
          child: const SearchView(),
        ),
      ),
    ],
  );
}
