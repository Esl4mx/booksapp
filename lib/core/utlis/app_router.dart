import 'package:booksapp/Features/home/presentation/views/book_details_view.dart';
import 'package:booksapp/Features/home/presentation/views/home_view.dart';
import 'package:booksapp/Features/search/presentation/views/search_view.dart';
import 'package:booksapp/Features/splash/presentation/views/splash_view.dart';
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
        builder: (context, state) => const BookDetailsView(),
      ),
      GoRoute(
        path: searchviewRoute,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
