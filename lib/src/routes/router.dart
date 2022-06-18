import 'package:dang/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:dang/src/routes/index.dart';
import 'package:dang/src/ui/views/home_page.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case entryPoint:
        return MaterialPageRoute(
          builder: (_) => const EntryPoint(),
        );
      case homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
          settings: RouteSettings(arguments: settings.arguments),
        );
      default:
        return _errorRoute(settings.name);
    }
  }

  static Route<dynamic> _errorRoute(String? name) {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('ERROR'),
          centerTitle: true,
        ),
        body: Center(
          child: Text('No route defined for $name'),
        ),
      );
    });
  }
}
