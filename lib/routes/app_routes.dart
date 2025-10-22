import 'package:flutter/material.dart';
import 'package:omni_codec_player/pages/audio_page.dart';
import 'package:omni_codec_player/pages/convert_to_audio_page.dart';
import 'package:omni_codec_player/pages/home_page.dart';
import 'package:omni_codec_player/pages/browse_page.dart';
import 'package:omni_codec_player/pages/main_page.dart';
import 'package:omni_codec_player/pages/more_page.dart';
import 'package:omni_codec_player/pages/most_and_favorite_page.dart';
import 'package:omni_codec_player/pages/settings_page.dart';
import 'package:omni_codec_player/pages/video_page.dart';
import 'package:omni_codec_player/routes/transition_animations/app_transition_animations.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return AppTransitionAnimations.createRouteWithAnimation(
          MainPage(),
          settings,
          "fade",
        );

      case '/home':
        final args = settings.arguments as Map<String, dynamic>;
        final animationType = args['animationType'] as String;
        return AppTransitionAnimations.createRouteWithAnimation(
          HomePage(),
          settings,
          animationType,
        );

      case '/browse':
        final args = settings.arguments as Map<String, dynamic>;
        final animationType = args['animationType'] as String;
        return AppTransitionAnimations.createRouteWithAnimation(
          BrowsePage(),
          settings,
          animationType,
        );

      case '/more':
        final args = settings.arguments as Map<String, dynamic>;
        final animationType = args['animationType'] as String;
        return AppTransitionAnimations.createRouteWithAnimation(
          MorePage(),
          settings,
          animationType,
        );

      case '/audio':
        final args = settings.arguments as Map<String, dynamic>;
        final animationType = args['animationType'] as String;
        return AppTransitionAnimations.createRouteWithAnimation(
          AudioPage(),
          settings,
          animationType,
        );

      case '/video':
        final args = settings.arguments as Map<String, dynamic>;
        final animationType = args['animationType'] as String;
        return AppTransitionAnimations.createRouteWithAnimation(
          VideoPage(),
          settings,
          animationType,
        );

      case '/mostAndFavorite':
        final args = settings.arguments as Map<String, dynamic>;
        final isMostPlayed = args['isMostPlayed'] as bool;
        final animationType = args['animationType'] as String;
        return AppTransitionAnimations.createRouteWithAnimation(
          MostAndFavoritePage(isMostPlayed: isMostPlayed),
          settings,
          animationType,
        );

      case '/converter':
        final args = settings.arguments as Map<String, dynamic>;
        final animationType = args['animationType'] as String;
        return AppTransitionAnimations.createRouteWithAnimation(
          ConvertToAudioPage(),
          settings,
          animationType,
        );

      case '/settings':
        final args = settings.arguments as Map<String, dynamic>;
        final animationType = args['animationType'] as String;
        return AppTransitionAnimations.createRouteWithAnimation(
          SettingsPage(),
          settings,
          animationType,
        );

      default:
        return AppTransitionAnimations.createRouteWithAnimation(
          Scaffold(
            appBar: AppBar(),
            body: Center(child: Text("Route Not Found")),
          ),
          settings,
          "rotation",
        );
    }
  }
}
