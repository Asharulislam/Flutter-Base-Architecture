// ignore_for_file: avoid_print

import 'package:dang/src/models/theme_model.dart';
import 'package:dang/src/routes/index.dart';
import 'package:dang/src/routes/router.dart';
import 'package:dang/src/sources/shared_preferences.dart';
import 'package:dang/src/ui/views/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceManager.init();

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<ThemeModel>.value(value: ThemeModel())
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: entryPoint,
      onGenerateRoute: MyRouter.generateRoute,
      theme: Provider.of<ThemeModel>(context).currentTheme,
    );
  }
}

class EntryPoint extends StatelessWidget {
  const EntryPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: const HomePage(),
      ),
    );
  }
}
