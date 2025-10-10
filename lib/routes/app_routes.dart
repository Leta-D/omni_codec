import 'package:flutter/material.dart';
import 'package:omni_codec_player/pages/main_page.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => MainPage());

      case '/home':
        return MaterialPageRoute(builder: (context) => MainPage());

      case '/library':
        return MaterialPageRoute(builder: (context) => MainPage());

      case '/audio':
        return MaterialPageRoute(builder: (context) => MainPage());

      case '/video':
        return MaterialPageRoute(builder: (context) => MainPage());

      case '/settings':
        return MaterialPageRoute(builder: (context) => MainPage());

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(),
            body: Center(child: Text("Route Not Found")),
          ),
        );
    }
  }
}
