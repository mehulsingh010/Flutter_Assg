import 'package:flutter/material.dart';
import 'home.dart';
import 'details.dart';

class AppRoutes {
  static const String home = '/';
  static const String details = '/details';

  static final Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(),
    details: (context) => const DetailsScreen(),
  };
}
