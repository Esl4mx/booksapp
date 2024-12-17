import 'package:booksapp/Features/home/data/repos/home_repo_impl.dart';
import 'package:booksapp/Features/home/presentation/views_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:booksapp/Features/home/presentation/views_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:booksapp/Features/splash/presentation/views/splash_view.dart';
import 'package:booksapp/core/utlis/api_services.dart';
import 'package:booksapp/core/utlis/app_router.dart';
import 'package:booksapp/core/utlis/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants.dart';

void main() {
  setupServiceLocator();
  runApp(const BooksApp());
}

class BooksApp extends StatelessWidget {
  const BooksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(getIt.get<HomeRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(getIt.get<HomeRepoImpl>()),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
      ),
    );
  }
}
