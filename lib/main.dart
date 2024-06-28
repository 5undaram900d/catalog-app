
import 'package:catalog_app/CatalogApp/Pages/a00_startPage.dart';
import 'package:catalog_app/CatalogApp/core/A13_Store.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  setPathUrlStrategy();
  runApp(
    VxState(      /// use for the purpose of refreshing the things
      store: MyStore(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: A00_StartPage(),
    );
  }
}
