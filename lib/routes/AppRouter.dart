import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_observation_assignment/screens/main/hotels_page.dart';

import '../screens/auth/auth_screen.dart';
import '../screens/splash_screen.dart';
import 'RoutesNames.dart';
import 'RoutingData.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var uriData = Uri.parse(settings.name!);

    print('settings.name ${settings.name}');

    print('queryParameters: ${uriData.queryParameters} path: ${uriData.path}');

    var routingData = RoutingData(
      queryParameters: uriData.queryParameters,
      route: uriData.path,
    );

    print("objecttype = ${routingData['order_id'].runtimeType}");
    print("id object= ${routingData['order_id']}");
    print("area object= ${routingData['area']}");

    switch (routingData.route) {
      case RouteName.SPLASH:
        return _getPageRoute(SplashScreen(), settings);

      case RouteName.AUTH:
        return _getPageRoute(AuthScreen(), settings);

      case RouteName.MAIN:
        return _getPageRoute(HotelsPage(), settings);

      default:
        return _getPageRoute(HotelsPage(), settings);
    }
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget? child;
  final String? routeName;

  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child!,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
