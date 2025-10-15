import 'package:flutter/material.dart';

class AppTransitionAnimations {
  static Route createRouteWithAnimation(
    Widget page,
    RouteSettings settings,
    String type,
  ) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 600),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // start from right
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        final animationTypes = {
          "scale": ScaleTransition(scale: animation, child: child),
          "fade": FadeTransition(opacity: animation, child: child),
          "rotation": RotationTransition(
            turns: animation,
            child: ScaleTransition(scale: animation, child: child),
          ),
          "slide": SlideTransition(
            position: animation.drive(tween),
            child: child,
          ),
        };

        return animationTypes[type] ??
            FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
