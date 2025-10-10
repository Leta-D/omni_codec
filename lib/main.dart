import 'package:flutter/material.dart';
import 'package:omni_codec_player/pages/main_page.dart';
import 'package:omni_codec_player/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Omni Codec',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 58, 183, 85),
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: AppRoutes.generateRoute,
      home: MainPage(),
    );
  }
}
