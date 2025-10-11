import 'package:flutter/material.dart';
import 'package:omni_codec_player/pages/audio_page.dart';
import 'package:omni_codec_player/pages/home_page.dart';
import 'package:omni_codec_player/pages/library_page.dart';
import 'package:omni_codec_player/pages/main_page.dart';
import 'package:omni_codec_player/pages/more_page.dart';
import 'package:omni_codec_player/pages/most_and_favorite_page.dart';
import 'package:omni_codec_player/pages/settings_page.dart';
import 'package:omni_codec_player/pages/video_page.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => MainPage());

      case '/home':
        return MaterialPageRoute(builder: (context) => HomePage());

      case '/library':
        return MaterialPageRoute(builder: (context) => LibraryPage());

      case '/more':
        return MaterialPageRoute(builder: (context) => MorePage());

      case '/audio':
        return MaterialPageRoute(builder: (context) => AudioPage());

      case '/video':
        return MaterialPageRoute(builder: (context) => VideoPage());

      case '/mostAndFavorite':
        return MaterialPageRoute(builder: (context) => MostAndFavoritePage());

      case '/settings':
        return MaterialPageRoute(builder: (context) => SettingsPage());

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
