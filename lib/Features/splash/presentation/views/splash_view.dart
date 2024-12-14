import 'package:flutter/material.dart';

import 'widgets/splash_view_body.dart';

class SplashViwe extends StatelessWidget {
  const SplashViwe({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff100B20),
      body: SplashViewBody(),
    );
  }
}
